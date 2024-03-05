locals{
  key_name = "demo-key-pair"
}


resource "aws_instance" "example" {
  ami           = "ami-0440d3b780d96b29d"  # Replace with your desired AMI ID
  instance_type = "t2.micro"                # Replace with your desired instance type
  key_name      = "my-key-pair"             # Replace with your desired key pair name

  subnet_id     =  var.subnet_1_id

  vpc_security_group_ids = [var.security_group_h]

}


