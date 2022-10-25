terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" {
    bucket         = "node-api-tfsate-allu"
    key            = "node-api.tfstate"
    region         = "eu-north-1"
    encrypt        = true
    dynamodb_table = "node-api-ts-state-lock" # the table name has a typo, should be '...tf-state-lock' not 'ts' but oh well
  }
}

provider "aws" {
  region = "eu-north-1"
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Environment = terraform.workspace
    Project     = var.project
    Owner       = var.contact
    ManagedBy   = "Terraform"
  }
}

data "aws_region" "current" {

}