locals{
  key_name = "demo-key-pair"
}


resource "aws_instance" "ec2_t2.micro" {
  ami           = "ami-0440d3b780d96b29d"
  instance_type = "t2.micro"
  key_name      = local.key_name

  subnet_id     =  var.subnet_1_id

  vpc_security_group_ids = [var.security_group_h]

}

