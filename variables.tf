variable "subnet_1_id" {
  type = string
}

variable "security_group_h" {
  type = string
}

variable "security_group_ssh" {
  type = string
}

variable "vpc_id" {
  type = string
  default = "vpc-0a5d9e7a9f4f4b9e5"
}

variable "subnet_2_id" {
  type = string
  default = "sam"
}

#########################
# S3 bucket variables

variable "bucket_name_web" {
  type = string
  default = "web-s3-bucket-tf-143"
}

#########################
# EC2 variables




