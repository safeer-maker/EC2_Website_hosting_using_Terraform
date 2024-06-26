# Local variable for Avalibility Zones
locals {
  availability_zone_1   = "us-east-1a"
  availability_zone_2 = "us-east-1b"
}

# Local variable for names of VPC, Internet Gateway, Route Table, Subnets 
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
  availability_zone = local.availability_zone_1

  tags = {
    terraform = "true"
    Name = local.subnet_name_1
  }
}

# second public subnet
resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.tf_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = local.availability_zone_2

  tags = {
    terraform = "true"
    Name = local.subnet_name_2
  }
}

# Internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.tf_vpc.id

  tags = {
    terraform = "true"
    Name = local.ig_name
  }
}

# Route Table
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.tf_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    terraform = "true"
    Name      = local.rtc_name
  }
}

resource "aws_route_table_association" "public_subnet_1_association" {
  route_table_id = aws_route_table.my_route_table.id
  subnet_id = aws_subnet.public_subnet_1.id
}

resource "aws_route_table_association" "public_subnet_2_association" {
  route_table_id = aws_route_table.my_route_table.id
  subnet_id = aws_subnet.public_subnet_2.id
}

# AWS Security Group
resource "aws_security_group" "security_group_http" {
  name   = "web_tf_http_allow"
  vpc_id = aws_vpc.tf_vpc.id
  
  # Allowing http incoming only
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }
  # All outbond ports are allowed
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # '-1' defined all ports
    cidr_blocks      = ["0.0.0.0/0"]

  }
}

resource "aws_security_group" "security_group_ssh" {
  name   = "web_tf_ssh_allow"
  vpc_id = aws_vpc.tf_vpc.id
  
  # Allowing ssh incoming only
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }
  # All outbond ports are allowed
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # '-1' defined all ports
    cidr_blocks      = ["0.0.0.0/0"]

  }
}

# Private subnet resources

# first private subnet

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.tf_vpc.id
  cidr_block = "10.0.6.0/24"
  availability_zone = local.availability_zone_1

  tags = {
    terraform = "true"
    Name = local.subnet_name_p1
  }
}

# second public subnet
resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.tf_vpc.id
  cidr_block = "10.0.7.0/24"
  availability_zone = local.availability_zone_2

  tags = {
    terraform = "true"
    Name = local.subnet_name_p2
  }
}

# Route Table
resource "aws_route_table" "my_route_table_private" {
  vpc_id = aws_vpc.tf_vpc.id

  # route {
  #   cidr_block = "0.0.0.0/0"
  #   gateway_id = aws_internet_gateway.gw.id
  # }

  tags = {
    terraform = "true"
    Name      = local.rtc_name
  }
}

resource "aws_route_table_association" "private_subnet_1_association" {
  route_table_id = aws_route_table.my_route_table_private.id
  subnet_id = aws_subnet.private_subnet_1.id
}

resource "aws_route_table_association" "private_subnet_2_association" {
  route_table_id = aws_route_table.my_route_table_private.id
  subnet_id = aws_subnet.private_subnet_2.id
}
