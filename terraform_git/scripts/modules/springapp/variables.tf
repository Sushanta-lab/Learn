variable "app_name" {
  type        = string
  description = "App Name"
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

