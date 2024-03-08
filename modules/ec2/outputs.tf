output "aws_public_ip" {
  value = aws_instance.ec2_web.public_ip
}

output "aws_instance_id" {
  value = aws_instance.ec2_web.id
}
