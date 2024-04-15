variable "subnet_ids" {
  type = list(string)
}

variable "security_group_h" {
  type = string
}

variable "security_group_ssh" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "vpc_id_ec2" {
  type = string
}

variable "web_ami_id" {
  type = string
  default = "ami-0440d3b780d96b29d"
}
