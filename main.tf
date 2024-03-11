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
        version = "5.39.1"
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
    subnet_2_id = module.vpc.public_subnet_2_id
    
    security_group_h = module.vpc.security_group_http
    security_group_ssh = module.vpc.security_group_ssh
    bucket_name = module.s3.s3_bucket_id

    # ALB variable
    vpc_id_ec2 = module.vpc.vpc_id
    web_ami_id = var.ami_id

}

module "s3" {
  
  source = "./modules/s3"
  bucket_name_web = var.bucket_name_web

}

