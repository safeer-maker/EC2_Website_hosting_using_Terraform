# Create IAM role for ALB
# resource "aws_iam_role" "ec2_role" {
#   name = "ec2_role"
#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       },
#       "Effect": "Allow",
#       "Sid": ""
#     }
#   ]
# }
# EOF
# }

resource "aws_ami_from_instance" "web_ec2_ami" {
  name = "web-ec2-ami"
  source_instance_id = aws_instance.ec2_web.id

  tags = {
    terraform = "true",
    Name = "web-ec2-ami-tf-143"
  }
}

# Target from ALB to EC2
resource "aws_lb_target_group" "web_target_group" {
  name        = "web-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id_ec2
  target_type = "instance"

  health_check {
    path                = "/"
    port                = "80"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 3
    interval            = 5
  }
}

resource "aws_lb" "Web_ALB" {
    name               = "web-ALB-tf"
    internal           = false
    load_balancer_type = "application"
    security_groups    = [var.security_group_h]
    subnets            = [var.subnet_1_id, var.subnet_2_id]

     enable_deletion_protection = true
}


resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.Web_ALB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.web_target_group.arn
    }
}