locals {
    bucket_name = "web-s3-bucket-tf-143"
    index_file = "${path.root}/web/index.html"
}

# creating a s3 bucket
resource "aws_s3_bucket" "web_s3_bucket" {
  bucket = var.bucket_name_web

  tags = {
    Environment = "web"
    terraform = "true"
  }
}

# upload a file to s3 bucket
resource "aws_s3_object" "file_upload" {
  bucket = aws_s3_bucket.web_s3_bucket.id
  key = "web/index.html"
  source = local.index_file
  etag = filemd5(local.index_file)
  lifecycle {
    replace_triggered_by = [ terraform_data.file_update.output ]
  }
}

# pervent the file from being updated
# every single time with apply command
resource "terraform_data" "file_update" {
  input = filemd5(local.index_file)
}