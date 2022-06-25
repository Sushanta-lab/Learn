#authenticator_groups_config       = "gke-security@dwsamuat.com"
#auto_provisioning_service_account = "svcac-gke-sdlc-02@gke-171462-1-inf-platform.iam.gserviceaccount.com"
#boot_disk_kms_key_sys             = ""
#boot_disk_kms_key_app             = ""
cluster_dns_domain                = null
database_encryption = [{
  state    = "DECRYPTED"
  key_name = ""
}]
description                             = "GKE cluster"
#guest_accelerator_sys                   = []
#guest_accelerator_app                   = []
#kubelet_config_cpu_cfs_quota_sys        = false
#kubelet_config_cpu_cfs_quota_app        = false
kubelet_config_cpu_cfs_quota_period_sys = "300ms"
kubelet_config_cpu_cfs_quota_period_app = "300ms"
kubelet_config_cpu_manager_policy_sys   = "static"
kubelet_config_cpu_manager_policy_app   = "static"
labels_sys                              = { "key" : "value" }
labels_app                              = { "key" : "value" }
local_ssd_count_sys                     = 0
local_ssd_count_app                     = 0
location                                = "us-central1"
master_ipv4_cidr_block                  = "172.16.0.0/28"
max_node_count_sys                      = 4
max_node_count_app                      = 4
max_pods_per_node_sys                   = 8
max_pods_per_node_app                   = 8
max_surge_sys                           = 1
max_surge_app                           = 1
max_unavailable_sys                     = 1
max_unavailable_app                     = 1
min_master_version                      = null
min_node_count_sys                      = 2
min_node_count_app                      = 2
name                                    = "primary"
initial_node_count_sys                  = 2
#network                                 = google_compute_network.main.self_link
node_config_oauth_scopes_sys            = ["https://www.googleapis.com/auth/cloud-platform"]
#node_config_oauth_scopes_app            = ["https://www.googleapis.com/auth/cloud-platform"]
#node_config_service_account_sys         = "svcac-gke-sdlc-02@gke-171462-1-inf-platform.iam.gserviceaccount.com"
#node_config_service_account_app         = "svcac-gke-sdlc-02@gke-171462-1-inf-platform.iam.gserviceaccount.com"
node_group_sys                          = null
node_group_app                          = null
node_locations                          = ["us-central1-a"]
node_pool_location_sys                  = "us-central1"
node_pool_location_app                  = "us-central1"
node_pool_name_sys                      = "sdlc-sys"
node_pool_name_app                      = "sdlc-app"
pod_range_sys                           = "gke-pod"
pod_range_app                           = "gke-pod"
pod_secondary_range_name                = "k8s-pod-range"
project_id                              = "creating-and-61-e0e52c97"
region                                  = "us-central1"
release_channel                         = "REGULAR"
resource_labels = {
  "key" = "value"
}
services_secondary_range_name = "k8s-service-range"
#subnetwork                    = google_compute_subnetwork.private.self_link
tags_sys                      = ["one", "two"]
tags_app                      = ["one", "two"]
taint_app = [{
  key    = "node"
  value  = "applications"
  effect = "NO_SCHEDULE"
}]
workload_metadata_config_sys      = "GKE_METADATA"
workload_metadata_config_app      = "GKE_METADATA"
#workload_identity_config          = data.google_project.project.project_id.svc.id.goog
enable_private_endpoint           = false
enable_private_nodes              = true
master_authorized_networks_config = []
