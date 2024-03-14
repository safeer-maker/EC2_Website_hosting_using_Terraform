# # The AMI resources needed to be modefied to use the AMI created from the instance
# /*
# Specaial Note:
# the public ip address is require for isolated instances to run properly

# */
resource "aws_ami_from_instance" "web_ec2_ami" {
  name = "web-ec2-ami"
  source_instance_id = aws_instance.ec2_web.id

  tags = {
    terraform = "true",
    Name = "web-ec2-ami-tf-143"
  }
}

resource "aws_launch_template" "web_launch_template" {
  name_prefix   = "web-launch-template-"
  image_id      = aws_ami_from_instance.web_ec2_ami.id

  instance_type = "t2.micro"
  vpc_security_group_ids = [var.security_group_h, var.security_group_ssh]
  key_name = local.key_name
  # public_ip_address = true
  # user_data = base64encode (file("${path.root}/web/ec2_script.sh"))
  # user_data = base64encode (file("web/ec2_script.sh"))

  tags = {
    terraform = "true",
    Name = "web-ec2-lt_tf"
  }
}

# # lets create an auto scalling group from this launch template
# resource "aws_autoscaling_group" "web_asg" {
#   name                      = "web-asg"
#   max_size                  = 3
#   min_size                  = 1
#   desired_capacity          = 2
#   vpc_zone_identifier       = [var.subnet_1_id, var.subnet_2_id]
#   # load_balancers = [aws_lb.Web_ALB.name]
#   launch_template {
#     id = aws_launch_template.web_launch_template.id
#     version = "$Latest"
#   }
# }
