##### Providers #####

variable "project_id" {
  type        = string
  description = "The project id."
}

variable "region" {
  type        = string
  description = "Provide the region name"
}

##### Cluster #####

variable "name" {
  type        = string
  description = "The name of the cluster (required)"
}

variable "description" {
  type        = string
  description = "Description of the cluster"
}

variable "location" {
  type        = string
  description = "The location (region or zone) in which the cluster master will be created, as well as the default node location."
}



######### SpringApp Deployment #########
variable "app_name" {
  type        = string
  description = "The name of the cluster (required)"
}

variable "chart" {
  type        = string
  description = "Chart name"
}

variable "namespace" {
  type        = string
  description = "Please enter desired namespace :"
}

variable "docker-username" {
  type        = string
  description = "Please provide docker-username :"
}

variable "docker-password" {
  type        = string
  description = "Please provide docker-password :"
}

variable "docker-server" {
  type        = string
  description = "Please provide docker-server :"
}

