provider "google" {
  project = var.project_id
  region  = var.region
  access_token = "ya29.a0ARrdaM8FVm6Hd-lcq82s1S8HQblP7xXf93hxz1QSPvc3zSX0ULxaw2LeEQ0CGpxpYD-0fFuOLZrPui0mBJrbcj0u_BbjY6Z4JOoO-8sba5Fp_TFDKFCSW7ifZEc1vj3G2Xw-xERdKDgvEm1t_O6qdHnCnSejqtiJLQK0" 
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



