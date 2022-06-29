provider "google" {
  project = var.project_id
  region  = var.region
  credentials = file("local_file")
  #access_token = var.access_token
  #zone    = var.zone
}


data "google_client_config" "provider" {}

data "google_container_cluster" "primary" {
  name       = var.name
  location   = var.location
  depends_on = [google_container_cluster.primary]
}

provider "kubernetes" {
  host  = "https://${length(google_container_cluster.primary.endpoint) > 0 ? google_container_cluster.primary.endpoint : data.google_container_cluster.primary.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    length(google_container_cluster.primary.master_auth[0].cluster_ca_certificate) > 0 ? google_container_cluster.primary.master_auth[0].cluster_ca_certificate : data.google_container_cluster.primary.master_auth[0].cluster_ca_certificate,
  )
}



