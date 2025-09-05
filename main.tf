provider "null" {}

variable "secret_value" {
  description = "A sensitive value from CI/CD"
  default     = "super-secret-value"
  sensitive   = true
}

resource "null_resource" "ci10_demo" {
  provisioner "local-exec" {
    command = "echo 'Simulated deployment with secret: ${var.secret_value}' >> deployment.log"
  }
}
