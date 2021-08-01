# --- root/main.tf ---
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

resource "docker_image" "nodered_image" {
  # docker image
  name = "nodered/node-red:latest"
}

resource "docker_container" "nodered_container" {
  name = "nodered"
  # https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/image#read-only
  image = docker_image.nodered_image.latest
  ports {
    internal = 1880
    external = 1880
  }
}
