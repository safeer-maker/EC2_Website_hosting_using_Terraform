# Output the VPC ID
output "vpc_id" {
  value = aws_vpc.tf_vpc.id
}

data "aws_region" "current" {}

output "region" {
  value = data.aws_region.current.name
}

output "public_subnet_1_id" {
  value = aws_subnet.public_subnet_1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.public_subnet_2.id
}

output "private_subnet_1_id" {
  value = aws_subnet.public_subnet_1.id
}

output "private_subnet_2_id" {
  value = aws_subnet.public_subnet_2.id
}
output "public_subnet_1_AZ" {
  value = aws_subnet.public_subnet_1.availability_zone
}

output "public_subnet_2_AZ" {
  value = aws_subnet.public_subnet_2.availability_zone
}

output "security_group_http" {
  value = aws_security_group.security_group_http.id
}

output "security_group_ssh" {
  value = aws_security_group.security_group_ssh.id
}
