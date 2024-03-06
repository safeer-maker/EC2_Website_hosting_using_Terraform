locals{
  key_name = "aws-ec2-tf-key-pair"
  IAM_role = "EC2-IAM-S3-ReadAccess"
}

resource "aws_instance" "ec2_web" {
  ami           = "ami-0440d3b780d96b29d"
  instance_type = "t2.micro"
  key_name      = local.key_name

  
  subnet_id     =  var.subnet_1_id
  vpc_security_group_ids = [var.security_group_h, var.security_group_ssh]

  associate_public_ip_address = true
  iam_instance_profile = local.IAM_role
  
  user_data = <<-EOF
              #!/bin/bash
              # Use this for your user data (script from top to bottom)
              # install httpd (Linux 2 version)
              yum update -y
              yum install -y httpd
              # systemctl start httpd
              # systemctl enable httpd
              # echo "<h1>Hello Safeer Ahmad from $(hostname -f)</h1>" > /var/www/html/index.html
              sudo yum install nginx -y
              sudo systemctl start nginx
              aws s3 sync s3://safeer-aws-cli-bucket-1234 ./web
              cp /web/index.html /var/www/html/index.html
              EOF
  
  tags = {
    Name = "tf_web_server"
  }
}

# resource "aws_iam_role" "ec2_role_to_s3" {
#   name = local.IAM_role
#   assume_role_policy = jsonencode({
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Sid": "VisualEditor0",
#       "Effect": "Allow",
#       "Action": [
#         "s3:ListBucket",
#         "s3:GetObject"
#       ],
#       "Resource": [
#         "arn:aws:s3:::bucket-name",
#         "arn:aws:s3:::bucket-name/*" 
#       ]
#     }
#   ]
# }
# )
  
# }