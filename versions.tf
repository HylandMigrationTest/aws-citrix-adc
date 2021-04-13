terraform {
  required_version = ">= 0.13.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.10"
    }
  }

  backend "remote" {
    hostname     = "terraform.hylandcloud.com"
    organization = "Hyland-GCS"

    workspaces {
      prefix = "aws-citrix-adc-"
    }
  }
}