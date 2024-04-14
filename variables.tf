############################
# vpc variables
variable "project_name" {
  type = string
  default = "web_tf"
}

variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

# #########################
# # S3 bucket variables

# variable "bucket_name_web" {
#   type = string
#   default = "web-s3-bucket-tf-143"
# }

# #########################
# # EC2 variables

# variable "ami_id" {
#   type = string
#   default = "ami-0440d3b780d96b29d"
# }
