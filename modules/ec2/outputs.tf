output "aws_public_ip" {
  value = aws_instance.ec2_web.public_ip
}

output "aws_instance_id" {
  value = aws_instance.ec2_web.id
}

# output "aws_IAM_role" {
#   value = aws_iam_role.ec2_role_to_s3.name
# }
