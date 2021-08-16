# --- root/main.tf ---
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

resource "null_resource" "dockervol" {
  provisioner "local-exec" {
    command = "mkdir -p noderedvol/  && sudo chown -R 1000:1000 noderedvol/"
  }
}

resource "docker_image" "nodered_image" {
  # docker image
  # name = lookup(var.image, terraform.workspace)
  name = var.image[terraform.workspace]
}

resource "random_string" "random" {
  count   = local.container_count
  length  = 4
  special = false
  upper   = false
}

resource "docker_container" "nodered_container" {
  count = local.container_count
  name  = join("-", ["nodered", terraform.workspace, random_string.random[count.index].result])
  image = docker_image.nodered_image.latest
  ports {
    internal = var.int_port
    # external = lookup(var.ext_port, terraform.workspace)[count.index]
    external = var.ext_port[terraform.workspace][count.index]
  }

  volumes {
    container_path = "/data"
    // ローカルのパス
    host_path = "${path.cwd}/noderedvol"
  }
}
