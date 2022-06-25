# Defining each unique namespace for the GKE cluster  
resource "kubernetes_namespace" "gke_namespaces" {
  count = length(var.namespaces)
  metadata {
    annotations = var.namespaces[count.index].annotations
    labels      = var.namespaces[count.index].labels
    name        = var.namespaces[count.index].name
  }
}

# By default, the provider ignores any annotations and labels whose key names end with kubernetes.io. 
# This is necessary because such annotations can be mutated by server-side components and 
# consequently cause a perpetual diff in the Terraform plan output. If you explicitly specify 
# any such annotations in the configuration template then Terraform will consider these as normal 
# resource attributes and manage them as expected (while still avoiding the perpetual diff problem).


