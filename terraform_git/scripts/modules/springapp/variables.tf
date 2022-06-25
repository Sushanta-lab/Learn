variable "name" {
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

