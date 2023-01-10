# Terraform block

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Provider block

provider "aws" {
  region                  = var.aws_region
  shared_credentials_file = "~/.aws/credentials"
}