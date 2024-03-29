######################
# Output for VPC module
output "vpc_id" {
  value = module.vpc.vpc_id
}
output "region" {
  value = module.vpc.region
}

output "public_subnet_1_id" {
  value = module.vpc.public_subnet_1_id
}

output "public_subnet_2_id" {
  value = module.vpc.public_subnet_2_id
}

output "public_subnet_1_AZ" {
  value = module.vpc.public_subnet_1_AZ
}

output "public_subnet_2_AZ" {
  value = module.vpc.public_subnet_2_AZ
}

output "security_group_http" {
  value = module.vpc.security_group_http
}

output "security_group_ssh" {
  value = module.vpc.security_group_ssh
}

######################
# Output for EC2 module

output "aws_public_ip" {
  value = module.ec2.aws_public_ip
}

output "aws_instance_id" {
  value = module.ec2.aws_instance_id
}

######################
# output for S3 module

output "bucket_name" {
  value = module.s3.s3_bucket_id
  
}
output "load_balancers_dns" {
  value = module.ec2.load_balancers_dns
}
