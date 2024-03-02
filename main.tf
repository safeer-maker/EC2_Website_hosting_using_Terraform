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

module "ec2" {
    source = "./modules/ec2"
    subnet_1_id = module.vpc.public_subnet_1_id
    security_group_http = module.vpc.security_group_http
    
}
