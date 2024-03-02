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
