resource "helm_release" "spring" {
  depends_on = [kubernetes_secret.docker-registry]
  name        = var.name
  chart       = var.chart
  repository  = "../../../charts"
  namespace   = var.namespace
  max_history = 3
  create_namespace = true
  wait             = true
  reset_values     = true
}
