locals {
  availability_zone   = "us-east-1a"
  availability_zone_2 = "us-east-1b"
}

locals {
  vpc_name        = "web_tf_vpc"
  ig_name         = "web_tf_igw"
  rtc_name        = "web_tf_rt"
  subnet_name_1   = "web_tf_subnet_public_1"
  subnet_name_2   = "web_tf_subnet_public_2"
  subnet_name_p1  = "web_tf_subnet_private_1"
  subnet_name_p2  = "web_tf_subnet_private_2"
}

# Create a VPC
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc#cidr_block
resource "aws_vpc" "tf_vpc" {

  # cidr block gives us the range of Ip addresses in an VPC
  cidr_block = "10.0.0.0/16"

  tags = {
    terraform = "true"
    # To give name of vpc use name in tag.
    Name  = local.vpc_name
  }
}

# Public subnet resources
# first public subnet
resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.tf_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    terraform = "true"
    Name = local.subnet_name_1
  }
}

# second public subnet
resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.tf_vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    terraform = "true"
    Name = local.subnet_name_2
  }
}

# private sub nets
# 
# 


#Internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.tf_vpc.id

  tags = {
    terraform = "true"
    Name = local.ig_name
  }
}
