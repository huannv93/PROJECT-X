terraform {
#  backend "remote" {
#    organization = "your-organization-name"  # Replace with your Terraform Cloud organization name
#    workspaces {
#      name = "your-workspace-name"  # Replace with the name of your workspace in Terraform Cloud
#    }
#  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.44.0"

    }
  }
}
