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


######### Namespaces #########

variable "namespaces" {
  type        = list(object({ annotations = map(string), labels = map(string), name = string }))
  description = "List of 3 objects. Annotations: An unstructured key value map stored with the namespace that may be used to store arbitrary metadata. / labels: Map of string keys and values that can be used to organize and categorize (scope and select) namespaces. May match selectors of replication controllers and services. / name: Name of the namespace, must be unique. Cannot be updated."
}


######### RBAC roles #########

variable "rbac_namespace" {
  type        = string
  description = "Please enter desired namespace :"
}

variable "subject" {
  type        = list(object({ role = string, type = string, email_id = string, api_group = string, namespace = string }))
  description = "The Users, Groups, or ServiceAccounts to grant permissions to."
}

