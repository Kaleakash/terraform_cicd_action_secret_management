# main.tf

# Provider (null provider for simulation)
provider "null" {}

# Sensitive variable
variable "secret_value" {
  description = "A sensitive value from CI/CD"
  default     = "super-secret-value"
  sensitive   = true
}

# Create deployment.log reliably
resource "local_file" "deployment_log" {
  content  = "Simulated deployment with secret: ${var.secret_value}"
  filename = "deployment.log"
}
