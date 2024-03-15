# S3

S3 bucket in neede to store website data.

index.html and assets will be availabe in web foulder.

EC2 instance will fetch this data and publish the website.

All the conetents of s3 are not public and only be access by EC2 IAM role.

> Files are uploaded in S3 when there is change in data. In addition terraform is used to upload the data in S3.

`resource "terraform_data"` is used to triger data upload if index.html is changed.
