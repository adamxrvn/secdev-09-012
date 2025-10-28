# Демонстрационный TF с типовыми smell'ами для Checkov
terraform {
  required_version = ">= 1.5.0"
  
    required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
}

provider "null" {}

resource "null_resource" "demo" {
  triggers = {
    always = timestamp()
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Environment = "demo"
    ManagedBy   = "terraform"
  }
}
