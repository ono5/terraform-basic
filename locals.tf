# --- locals.tf ---
locals {
  # container_count = length(lookup(var.ext_port, terraform.workspace))
  container_count = length(var.ext_port[terraform.workspace])
}
