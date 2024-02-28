# VPC

Creating a fully functional VPC required multiple itmes to work.
## Table of Contents


## vpc
A VPC is a regional services. You can create your own vpc. Its a free services which isolate and provide network to sub modules in a region. You can have multiple VPC in one region with will be isoloated form each other.

[VPC in tf](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc#cidr_block)

```go
resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
}
```
> We will create four subnets in this VPC.
 - Public Subnet
    * Two public subnets so that we can access ec2 hosted website from  internet
 - Private Subnet 
    * Two private subnets so that the ec2 instance are access thorough only cloudfront for web hosting.

## Subnets

Subnets are AZ scoped. All resources in an AZ are hosted in that specific subnet. Subnets can be isolate the network in same AZ with multiple subnets

## Internet gateway

## Route table

## Security Group