locals {
    bucket_name = "web-s3-bucket-tf-143"
}

resource "aws_s3_bucket" "web_s3_bucket" {
  bucket = var.bucket_name_web

  tags = {
    Environment = "web"
    terraform = "true"
  }
}
