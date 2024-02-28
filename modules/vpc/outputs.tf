# Output the VPC ID
output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

data "aws_region" "current" {}

output "region" {
  value = data.aws_region.current.name
}


