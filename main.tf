# main.tf

# Use null provider to simulate deployment
provider "null" {}

# Sensitive variable
variable "secret_value" {
  description = "A sensitive value from CI/CD"
  default     = "super-secret-value"
  sensitive   = true
}

# Null resource to simulate deployment
resource "null_resource" "ci10_demo" {
  provisioner "local-exec" {
    # Write secret to deployment.log in current working directory
    command = "echo 'Simulated deployment with secret: ${var.secret_value}' >> $PWD/deployment.log"
  }
}
