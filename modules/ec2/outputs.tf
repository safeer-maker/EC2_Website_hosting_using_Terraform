output "aws_public_ip" {
  value = aws_instance.ec2_web.public_ip
}

output "aws_instance_id" {
  value = aws_instance.ec2_web.id
}

output "load_balancers_dns" {
  value = aws_lb.Web_ALB.dns_name
}