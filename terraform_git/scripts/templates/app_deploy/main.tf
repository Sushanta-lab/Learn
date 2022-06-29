module "springapp" {
  source     = "../../modules/springapp"
  namespace = var.namespace
  app_name  = var.app_name
  chart     = var.chart
  docker-username = var.docker-username
  docker-password = var.docker-password
  docker-server = var.docker-server
}

