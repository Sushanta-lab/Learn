provider "google" {
  project = var.project_id
  region  = var.region
  access_token = "ya29.a0ARrdaM93Ef8uWuf0k8ba50BN9qH4uUE4IT0RS2Bamky8Nss-CYL_l3ApH_gZe81p6LbG7M-X2LcmV8-hzELNbIyI1hZaTP9NpuJYC451kNeLKjlkk_YhcpXSvYQaeQL0wjuQ4A1QugXRfnks64Dg3WHxbpzjwM5e1hUU"
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



