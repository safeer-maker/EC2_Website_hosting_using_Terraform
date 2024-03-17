# S3

S3 bucket in neede to store website data.

- index.html and assets will be availabe in web foulder.

- EC2 instance will fetch this data and publish the website.

- All the conetents of s3 are not public and only be access by EC2 IAM role.

# Managing S3 Bucket and File Upload with Terraform

In this Terraform configuration, we are creating an S3 bucket and uploading a file to it.

## Table of Contents

- [Introduction](#introduction)
- [Creating S3 Bucket](#creating-s3-bucket)
- [Uploading File to S3 Bucket](#uploading-file-to-s3-bucket)
- [Preventing File Updates](#preventing-file-updates)

## Introduction

This Terraform configuration script manages an S3 bucket named "web-s3-bucket-tf-143" and uploads an HTML file to it.

## Creating S3 Bucket

The following code block creates the S3 bucket:

```go
resource "aws_s3_bucket" "web_s3_bucket" {
  bucket = local.bucket_name
}
```

## Uploading File to S3 Bucket

This code block uploads the HTML file to the S3 bucket:
```go
resource "aws_s3_object" "file_upload" {
  bucket = aws_s3_bucket.web_s3_bucket.id
  key = "web/index.html"
  source = local.index_file
  etag = filemd5(local.index_file)

}
```

## Preventing File Updates
To prevent the file from being updated every time with the terraform apply command, we use the following resource:

``` go
resource "terraform_data" "file_update" {
  input = filemd5(local.index_file)
}

resource "aws_s3_object" "file_upload" {
  # S3 file upload 
  ''' 
  '''
  lifecycle {
    replace_triggered_by = [ terraform_data.file_update.output ]
  }
}

```


