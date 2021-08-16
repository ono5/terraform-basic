# --- root/variables ---
# variable "env" {
#   type        = string
#   description = "Env to deploy to"
#   default     = "dev"
# }

variable "image" {
  type        = map(any)
  description = "image for container"
  default = {
    dev  = "nodered/node-red:latest"
    prod = "nodered/node-red:latest-minimal"
  }
}

variable "ext_port" {
  description = "external port"
  # sensitive   = true
  # type = list(number)
  type = map(any)

  validation {
    condition     = max(var.ext_port["dev"]...) <= 65535 && min(var.ext_port["dev"]...) >= 1980
    error_message = "The external port must be in the valid port range 0 - 65535."
  }

  validation {
    condition     = max(var.ext_port["prod"]...) < 1980 && min(var.ext_port["prod"]...) >= 1880
    error_message = "The external port must be in the valid port range 0 - 65535."
  }
}

variable "int_port" {
  default     = "1880"
  type        = number
  description = "external port"

  validation {
    condition     = var.int_port == 1880
    error_message = "The internal port must be 1880."
  }
}

variable "container_count" {
  default = 3
  type    = number
}
