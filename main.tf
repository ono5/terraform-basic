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

resource "random_string" "random" {
  count   = 2 # リソースを2つ作る
  length  = 4
  special = false
  upper   = false
}

resource "docker_container" "nodered_container" {
  count = length(random_string.random) // random数分作る
  name  = join("-", ["nodered", random_string.random[count.index].result])
  image = docker_image.nodered_image.latest
  ports {
    internal = 1880
    # external = 1880
  }
}

output "IP-Address" {
  value = docker_container.nodered_container[*].ip_address

  description = "The IP address of the container"
}

output "container-name" {
  value       = docker_container.nodered_container[*].name
  description = "The name of the container"
}
