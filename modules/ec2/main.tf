
# data "aws_default_vpc" "default" {}

# data "aws_default_subnet" "default" {
#   vpc_id = data.aws_default_vpc.default.id
# }

# data "aws_default_security_group" "default" {
#   vpc_id = data.aws_default_vpc.default.id
# }

resource "aws_instance" "example" {
  ami           = "ami-0440d3b780d96b29d"  # Replace with your desired AMI ID
  instance_type = "t2.micro"                # Replace with your desired instance type
  //key_name      = "my-key-pair"             # Replace with your desired key pair name

  //subnet_id     = var.subnet_1_id
  //subnet_id     = module.vpc.public_subnet_1_id
  //vpc_security_group_ids = var.security_group_http
}



