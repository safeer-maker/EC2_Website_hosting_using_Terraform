# EC2 Website Hosting using Terraform

This README provides instructions on how to set up a static website hosting using EC2, S3, and CloudFront with Terraform.

## Prerequisites

Before you begin, make sure you have the following:

- An AWS account
- Terraform installed on your local machine
- Basic knowledge of AWS services

## Architecture Overview

The architecture for the static website hosting using EC2, S3, and CloudFront is as follows:

1. EC2 Instance: Acts as a web server to serve the website content.
2. S3 Bucket: Stores the static website files.
3. CloudFront: Acts as a content delivery network (CDN) and provides caching and distribution of the website content.

## Steps to Set Up

1. Clone this repository to your local machine.
2. Navigate to the `main` module directory.
3. Update the `variables.tf` file with your desired configurations.
4. Run `terraform init` to initialize the Terraform configuration.
5. Run `terraform plan` to review the planned changes.
6. Run `terraform apply` to apply the changes and create the infrastructure.
7. Wait for the Terraform deployment to complete.
8. Once the deployment is complete, you will see the output variables containing the necessary information to access your website.

## Accessing the Website

To access the website, follow these steps:

1. Open your web browser.
2. Enter the CloudFront URL provided in the Terraform output variables.
3. You should now be able to access your static website.

## Cleaning Up

To clean up and delete the infrastructure, run the following command:

```bash
