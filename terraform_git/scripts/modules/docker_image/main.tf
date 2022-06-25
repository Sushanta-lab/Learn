resource "null_resource" "docker_build" {

triggers = {
always_run = timestamp()

}

provisioner "local-exec" {
working_dir = path.module
command     = "docker build -t springapp . && docker tag springapp gcr.io/creating-and-61-b44a31e3/springjar:v1 && docker push gcr.io/creating-and-61-b44a31e3/springjar:v1"
}
}
