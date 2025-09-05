# main.tf

provider "null" {}

variable "secret_value" {
  description = "A sensitive value from CI/CD"
  default     = "super-secret-value"
  sensitive   = true
}

# Use a local file resource instead of local-exec
resource "local_file" "deployment_log" {
  content  = "Simulated deployment with secret: ${var.secret_value}"
  filename = "deployment.log"
}
