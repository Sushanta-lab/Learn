terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 1.19.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 1.5.4"
    }
  }

  #backend "gcs" {}
}

provider "google" {
  project = var.project_id
  region  = var.region
}


data "google_client_config" "provider" {}

data "google_container_cluster" "primary" {
  
  name       = var.name
  location   = var.location
  depends_on = [data.google_container_cluster.primary]
}

/*provider "kubernetes" {
  host  = "https://${data.google_container_cluster.primary.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.primary.master_auth[0].cluster_ca_certificate,
  )
}*/

provider "helm" {
    kubernetes {
    host  = "https://${data.google_container_cluster.primary.endpoint}"
    token = data.google_client_config.provider.access_token
    cluster_ca_certificate = base64decode(
    data.google_container_cluster.primary.master_auth[0].cluster_ca_certificate,
  )
  }
}
