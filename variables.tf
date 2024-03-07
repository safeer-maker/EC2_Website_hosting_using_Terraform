variable "subnet_1_id" {
  type = string
}

variable "security_group_h" {
  type = string
}

variable "security_group_ssh" {
  type = string
}

#########################
# S3 bucket variables

variable "bucket_name_web" {
  type = string
  default = "web-s3-bucket-tf-143"
}

