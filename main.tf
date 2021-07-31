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
  name = "nodered/node-red]latest"
}
