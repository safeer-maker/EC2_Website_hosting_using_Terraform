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
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    terraform = "true"
    Name = local.vpc_name
  }
}

# Create an internet gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  
  tags = {
    terraform = "true"
    Name = local.ig_name
  }
}

# Create a route table
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    terraform = "true"
    Name = local.rtc_name
  }
}

# Create a subnet
resource "aws_subnet" "my_subnet" {
    vpc_id            = aws_vpc.my_vpc.id
    cidr_block        = "10.0.1.0/24"
    availability_zone = local.availability_zone_2
    
    tags = {
    terraform = "true"
    Name = local.subnet_name
  }
}


# Associate the route table with the VPC's main subnet
resource "aws_route_table_association" "my_route_table_association" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my_route_table.id

}
