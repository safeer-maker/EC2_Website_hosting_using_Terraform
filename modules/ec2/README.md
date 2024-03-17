# Terraform Infrastructure for Web Hosting
This repository contains Terraform scripts to set up various components of a cloud infrastructure on AWS. Below is a summary of what each section accomplishes.

## Table of Contents

- [VPC Section](#vpc-section)
- [S3 Section](#s3-section)
- [EC2 Section](#ec2-section)

---

## [VPC Section](/modules/vpc/README.md)

### Overview

The VPC (Virtual Private Cloud) section is responsible for creating a fully functional VPC using Terraform. It involves creating multiple components such as subnets, internet gateway, route table, and security group.

### Details

- **VPC Creation**: A VPC with CIDR block "10.0.0.0/16" is created.
- **Subnets**: Two public subnets ("10.0.1.0/24" and "10.0.2.0/24") are created for testing purposes.
- **Internet Gateway**: An internet gateway is attached to the VPC to provide internet access to resources.
- **Route Table**: A route table is set up to define network routes between subnets and the internet.
- **Security Group**: A security group named "sg" is defined to control inbound and outbound traffic.

---

## [S3 Section](/modules/s3/README.md)

### Overview

The S3 section is responsible for managing an S3 bucket to store website data. It includes uploading an HTML file to the bucket and ensuring that its contents are not publicly accessible.

### Details

- **S3 Bucket Creation**: An S3 bucket named "web-s3-bucket-tf-143" is created.
- **File Upload**: An HTML file along with assets is uploaded to the S3 bucket in the "web" folder.
- **EC2 Integration**: The EC2 instance fetches data from this S3 bucket to publish the website.
- **Access Control**: The contents of the S3 bucket are restricted to access only by the EC2 IAM role.

---

## [EC2 Section](/modules/ec2/README.md)

### Overview

The EC2 section deals with creating and configuring EC2 instances using Terraform. It covers VPC settings, user data, auto-scaling, and integration with an Application Load Balancer (ALB).

### Details

- **EC2 Instance Creation**: An EC2 instance is created with specified VPC settings, including subnets and security groups.
- **User Data**: User data is passed to the EC2 instance to set up a web server, fetch data from the S3 bucket, and start hosting a website.
- **ALB Integration**: An Application Load Balancer (ALB) is created to route traffic from the ALB to the EC2 instance.
- **Auto Scaling**: An Auto Scaling Group (ASG) is configured for fault tolerance and high availability by creating multiple instances based on a launch template.

---

This repository combines Terraform's infrastructure as code capabilities to create and manage a cloud infrastructure setup efficiently. Each section contributes to building a scalable, secure, and highly available architecture on AWS.
