terraform {
    cloud {
      organization = "safeerahmad"
      workspaces {
        project = "web_ec2_hosting"
        tags = [ "environment", "ubuntu" ]
      }
    }

    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "3.38.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}

module "vpc" {
    source = "./modules/vpc"
}
