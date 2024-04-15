# Local variable for names of VPC, Internet Gateway, Route Table, Subnets 
locals {
  Az_names = slice( data.aws_availability_zones.available.names , 0, var.max_subnet)

}

# Cretae sub nets in all AZ's
data "aws_availability_zones" "available" {
  state = "available"
}

# Create a VPC
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc#cidr_block
resource "aws_vpc" "tf_vpc" {

  # cidr block gives us the range of Ip addresses in an VPC
  cidr_block = var.vpc_cidr_block

  tags = {
    terraform = "true"
    # To give name of vpc use name in tag.
    Name  = "${var.project_name}_vpc"
  }
}

resource "aws_subnet" "tf_private_subnet" {
  for_each = {for idx, az in local.Az_names : idx => az}
  vpc_id = aws_vpc.tf_vpc.id
  cidr_block = cidrsubnet(aws_vpc.tf_vpc.cidr_block, 8, (each.key + (length(local.Az_names) * 0) ))
  availability_zone = each.value

  tags = {
    terraform = "true"
    Name = "${var.project_name}_subnet_private_${each.key}"
  }
}

# Internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.tf_vpc.id

  tags = {
    terraform = "true"
    Name = "${var.project_name}_ig"
  }
}

# Route Table
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.tf_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.gw.id
#   }

  tags = {
    terraform = "true"
    Name      = "${var.project_name}_private_route_table"
  }
}

resource "aws_route_table_association" "public_subnet_1_association" {
  count = length(local.Az_names)

  route_table_id = aws_route_table.my_route_table.id
  subnet_id = aws_subnet.tf_private_subnet[count.index].id
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

# resource "aws_eip" "nat_gateway" {
#   count = length(aws_subnet.tf_private_subnet)

#   tags = {
#     Name = "${var.project_name}_private_nat_gateway_eip_${count.index}"
#   }
# }

# resource "aws_nat_gateway" "default" {
#   count = length(aws_subnet.tf_private_subnet)

#   connectivity_type = "public"
#   subnet_id         = aws_subnet.tf_private_subnet[count.index].id
#   allocation_id     = aws_eip.nat_gateway[count.index].id
#   depends_on        = [aws_internet_gateway.gw]

#   tags = {
#     Name = "${var.project_name}_private_nat_gateway_${count.index}"
#   }
# }
