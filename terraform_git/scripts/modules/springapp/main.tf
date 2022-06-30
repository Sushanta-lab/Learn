resource "null_resource" "docker_build" {

triggers = {
always_run = timestamp()

}
provisioner "local-exec" {
working_dir = path.module
#command     = "docker build -t springapp . && docker tag springapp gcr.io/creating-and-61-b44a31e3/springjar:v1 && docker pushcr.io/creating-and-61-b44a31e3/springjar:v1"

command = "chmod +x ../docker-image/build-image.sh && chmod +x ../docker-image/push-image.sh && ../docker-image/build-image.sh ./springapp && ../docker-image/push-image.sh ./springapp"
}
}

resource "null_resource" "replace_values" {
depends_on = [null_resource.docker_build]
triggers = {
always_run = timestamp()

}
provisioner "local-exec" {
working_dir = path.module
#command = "chmod +x ../docker-image/env.sh && ../docker-image/env.sh && sed -i 's#tag: VERSION#tag: $VERSION#g' ../../../charts/spring/values.yaml"
command = "chmod +x ../docker-image/env.sh && ../docker-image/env.sh"
}
}

resource "kubernetes_secret" "docker-registry" {
  metadata {
    name = "regsecret"
    namespace = var.namespace
    annotations = {
      name = var.namespace
    }
    labels = {
      mylabel = "label-value"
    }
  }

  data = {
    ".dockerconfigjson" = "${data.template_file.docker_config_script.rendered}"
  }

  type = "kubernetes.io/dockerconfigjson"
}

data "template_file" "docker_config_script" {
  template = "${file("/home/k8smaster/.docker/config.json")}"
  #vars = {
  #  docker-username           = "${var.docker-username}"
  #  docker-password           = "${var.docker-password}"
  #  docker-server             = "${var.docker-server}"
  #  docker-email              = "${var.docker-email}"
  #  auth                      = base64encode("${var.docker-username}:${var.docker-password}")
  #}
}


resource "helm_release" "spring" {
  depends_on = [null_resource.docker_build, null_resource.replace_values, kubernetes_secret.docker-registry]
  name        = var.app_name
  chart       = var.chart
  repository  = "./../../../charts"
  namespace   = var.namespace
  max_history = 3
  create_namespace = true
  wait             = true
  reset_values     = true
}
