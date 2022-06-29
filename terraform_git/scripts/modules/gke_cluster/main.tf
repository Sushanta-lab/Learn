# Creating the GKE cluster
resource "google_container_cluster" "primary" {
  provider                 = google
  name                     = var.name
  description              = var.description
  location                 = var.location
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.main.self_link
  subnetwork               = google_compute_subnetwork.private.self_link
  networking_mode          = "VPC_NATIVE"
  node_locations           = var.node_locations

  addons_config {
    horizontal_pod_autoscaling {
      disabled = var.disable_horizontal_pod_autoscaling
    }
    http_load_balancing {
      disabled = var.disable_http_load_balancing
    }
  }

  release_channel {
    channel = var.release_channel
  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }


  default_max_pods_per_node   = var.default_max_pods_per_node

  ip_allocation_policy {
    cluster_secondary_range_name  = var.pod_secondary_range_name
    services_secondary_range_name = var.services_secondary_range_name
  }

  min_master_version = var.min_master_version

  private_cluster_config {
    enable_private_nodes    = var.enable_private_nodes
    enable_private_endpoint = var.enable_private_endpoint
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }


  project = var.project_id
  resource_labels = var.resource_labels




}

########## Node pools ##########

######### System nodes #########

# Creating node pool for the system nodes
resource "google_container_node_pool" "system_nodes" {
  provider   = google
  cluster    = google_container_cluster.primary.id
  initial_node_count = var.initial_node_count_sys
  max_pods_per_node = var.max_pods_per_node_sys
  name              = var.node_pool_name_sys

  management {
    auto_repair  = var.enable_management_auto_repair_sys
    auto_upgrade = var.enable_management_auto_upgrade_sys
  }


  node_config {
    preemptible       = var.enable_preemptible_sys
    machine_type      = var.machine_type_sys
    labels            = var.labels_sys
    service_account   = google_service_account.kubernetes.email
    oauth_scopes      = var.node_config_oauth_scopes_sys
  }
}

############################################################################
##########Google Service Account
###########################################################################
resource "google_service_account" "kubernetes" {
  account_id = "kubernetes"
}

############################################################################
##########VPC
###########################################################################
resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
}

resource "google_project_service" "container" {
  service = "container.googleapis.com"
}

resource "google_compute_network" "main" {
  name                            = "main"
  routing_mode                    = "REGIONAL"
  auto_create_subnetworks         = false
  mtu                             = 1460
  delete_default_routes_on_create = false

  depends_on = [
    google_project_service.compute,
    google_project_service.container
  ]
}
############################################################################
##########Subnet
###########################################################################
resource "google_compute_subnetwork" "private" {
  name                     = "private"
  ip_cidr_range            = "10.0.0.0/18"
  region                   = "us-central1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "k8s-pod-range"
    ip_cidr_range = "10.48.0.0/14"
  }
  secondary_ip_range {
    range_name    = "k8s-service-range"
    ip_cidr_range = "10.52.0.0/20"
  }
}

resource "google_service_account" "service_account" {
  account_id   = "creating-and-61-9d9a3974"
  display_name = "Test"
}


resource "google_service_account_key" "service_account" {
  service_account_id = google_service_account.service_account.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}


resource "local_file" "service_account" {
    content  = base64decode(google_service_account_key.service_account.private_key) 
    filename = "../../serviceaccount.json"
}
