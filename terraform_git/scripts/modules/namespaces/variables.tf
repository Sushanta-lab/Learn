variable "namespaces" {
  type        = list(object({ annotations = map(string), labels = map(string), name = string }))
  description = "List of 3 objects. Annotations: An unstructured key value map stored with the namespace that may be used to store arbitrary metadata. / labels: Map of string keys and values that can be used to organize and categorize (scope and select) namespaces. May match selectors of replication controllers and services. / name: Name of the namespace, must be unique. Cannot be updated."
}


