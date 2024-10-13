terraform {
  backend "s3" {
    # bucket         = "bucket: use locally"
    # key            = "bucket key: use locally"
    # region         = "region: use locally"
    # dynamodb_table = "dynamodb table: use locally"
    # encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.71"
    }
  }
}

provider "aws" {
  region = var.region
}