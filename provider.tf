# provider let know terraform which api to use.
# in our case provider is aws.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  profile = "terraform"    # this the profile which we created using aws configure cli command
  region  = var.aws_region # this will make default region as ap-south-1 which is in mumbai
}