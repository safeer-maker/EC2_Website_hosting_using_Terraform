locals {
  availability_zone   = "us-east-1a"
  availability_zone_2 = "us-east-1b"
}

locals {
  vpc_name        = "web_tf_vpc"
  ig_name         = "web_tf_igw"
  rtc_name        = "web_tf_rt"
  subnet_name     = "web_tf_subnet"
  subnet_name_2   = "web_tf_subnet_2"
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


