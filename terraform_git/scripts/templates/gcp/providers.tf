terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 1.19.0"
    }
    /*google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 1.19.0"
    }*/
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

/*provider "google-beta" {
  project = var.project_id
  region  = var.region
}*/


