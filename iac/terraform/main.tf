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
    always      = timestamp()
    environment = "demo"
    managed_by  = "terraform"
  }

  lifecycle {
    prevent_destroy = true
  }
}