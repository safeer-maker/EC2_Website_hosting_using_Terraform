locals{
  key_name = "aws-ec2-tf-key-pair"
  IAM_role = "EC2-IAM-S3-ReadAccess"
}

data "aws_ami" "web_ami" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "architecture"
    values = ["x86_64"]
  }
  filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }
}

resource "aws_instance" "ec2_web" {
  # ami           = data.aws_ami.web_ami.image_id
  ami           = var.web_ami_id
  instance_type = "t2.micro"
  key_name      = local.key_name
  
  subnet_id     =  var.subnet_ids[0]
  vpc_security_group_ids = [var.security_group_h, var.security_group_ssh]

  associate_public_ip_address = true
  iam_instance_profile = local.IAM_role
  
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              aws s3 sync s3://${var.bucket_name}/web /var/www/html/
              systemctl restart httpd
              EOF
  
  tags = {
    Name = "tf_web_server"
  }
}
