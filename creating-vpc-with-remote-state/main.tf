terraform {

  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.64.0"
    }
  }

  backend "s3" {
    bucket = "hennangadelhadev-terraform-in-practice"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"

  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      owner      = "hennangadelha"
      managed-by = "terraform"
    }
  }
}