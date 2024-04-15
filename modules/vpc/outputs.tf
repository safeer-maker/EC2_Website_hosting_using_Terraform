output "azs" {   
    value = local.Az_names
}

output "vpc_id" {
    value = aws_vpc.tf_vpc.id
}

output "subnet_ids" {
    value = aws_subnet.tf_private_subnet
}

output "security_group_http" {
    value = aws_security_group.security_group_http.id
}

output "security_group_ssh" {
    value = aws_security_group.security_group_ssh.id
}


