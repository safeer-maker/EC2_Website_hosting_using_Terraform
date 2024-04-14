######################
# Output for VPC module

output "vpc_id" {
  value = module.vpc.azs
} 

# ######################
# # Output for EC2 module

# output "aws_public_ip" {
#   value = module.ec2.aws_public_ip
# }

# output "aws_instance_id" {
#   value = module.ec2.aws_instance_id
# }

# ######################
# # output for S3 module

# output "bucket_name" {
#   value = module.s3.s3_bucket_id
  
# }
# output "load_balancers_dns" {
#   value = module.ec2.load_balancers_dns
# }
