# EC2 Website Hosting using Terraform

This repository is your secret weapon for building a rock-solid web hosting infrastructure on AWS. It leverages the power of Terraform, Infrastructure as Code (IaC), to automate the creation and management of all the essential components.

Here's what you get:

**Public VPC:** Imagine a secure neighborhood (VPC) with public entrances (subnets) for your web server to interact with the internet.

**S3 Bucket:** Think of this as your secure storage vault. It houses all your website data (HTML files, images, etc.) and keeps it safe.

**Auto Scaling Group (ASG):** This acts like a dynamic team of web servers, automatically scaling up or down based on traffic. No more struggling during peak hours!

**EC2 Instances:** These are the workhorses, the actual web servers that fetch content from S3 and serve it to your users.

**Application Load Balancer (ALB):** Picture a traffic director. It distributes incoming traffic evenly across all your healthy EC2 instances, ensuring high availability and preventing a single point of failure.

**Listeners:** These are like smart assistants for the ALB, directing traffic to the right web server based on specific rules (like port or path).

**CloudWatch:** This acts as your watchful eye, constantly monitoring the health and performance of your infrastructure. It provides valuable insights for troubleshooting and keeping things running smoothly.

## Benefits You Can't Ignore:

**Effortless Scaling:** The ASG ensures you always have enough web servers to handle traffic spikes, keeping your website snappy.

**High Availability:** The ALB distributes traffic, so if one server goes down, your website stays up and running.

**Built-in Security:** Public VPC and security groups restrict access, while IAM roles provide secure S3 access for your web servers.

**Always Watching:** CloudWatch keeps an eye on everything, allowing you to identify and address any potential issues before they impact your users.

## Getting Started - Your Guide to Web Hosting Nirvana:

**Prep Your Credentials:** Set up your AWS credentials to allow Terraform to interact with AWS services.

**Customize Your Infrastructure:** Review and tailor the Terraform configuration files in each module directory to fit your specific needs. This is where you fine-tune access permissions, user data for your web servers, and scaling policies.

**Terraform Magic:** Run `terraform init` to initialize Terraform and download any required plugins. Then, execute `terraform apply` to bring your infrastructure to life based on the Terraform configuration.

# Security First, Always!

**Layered Defense:** While the public VPC allows internet access, security groups ensure only essential traffic reaches your web servers.

**Least Privilege:** IAM roles for EC2 instances grant the minimum permissions needed to access specific S3 resources.

**Consider WAF:** For an extra layer of protection, explore using Web Application Firewalls (WAF).

# Maintaining Your Web Hosting Paradise:

**CloudWatch Dashboards:** Keep an eye on key metrics with CloudWatch dashboards to identify potential problems early on.

**Regular Reviews and Deployments:** Schedule regular checkups for your infrastructure and deploy updates to maintain top security and performance.

**IaC Advantage:** Leverage Terraform's IaC capabilities for version control and effortless infrastructure updates.

> This repository provides in-depth details on each module and configuration options within their respective READMEs. So, dive in, explore, and build your dream scalable web hosting infrastructure on AWS!