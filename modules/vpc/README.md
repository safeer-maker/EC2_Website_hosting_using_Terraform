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

Subnets are AZ scoped. All resources in an AZ are hosted in that specific subnet. Subnets can be isolate the network in same AZ with multiple subnets.

[Subnets in terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)

```go
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
}

```

 > Creating two public subnets for testing purposes. They did not serve the application purposed but testing is always good.
 > Two private subnets will be used for cloudfront destribution. 

## Internet gateway

Internet gateway provides internet resource to subnets. Internet gaetway attached subnet resources have access to internet. 

> you can also provide internet to update or pach your resources using NAT gateway. Nat gatewasy provide resources to private resources while keeping there state private.

[Internet gateway in terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway)

```go
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}
```

## Route table

Routing table privides network connection between sub nets. It is like a network switch that connect muliple subnets with each other and network gateway.

```go
resource "aws_route_table" "example" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.example.id
  }
}
```

Route table can attach inline network or NAT gateway.

To attach a subnet to route table you need to add `aws_route_table_association`module. ** Each subnet must have a seperate table association module to associate it to route table**
```go
resource "aws_route_table_association" "public_subnet_1_association" {
  route_table_id = aws_route_table.my_route_table.id
  subnet_id = aws_subnet.public_subnet_1.id
}
```

## Security Group

Security group is the firewall that allow or denay protocal level access to compute.
By default SG allow all outbound rules but in Terraform you have to define then seperately.

> Inbound and outbound both rules needed to define in terraform to allow communcation.

```go
resource "aws_security_group" "example" {
  name   = "sg"
  vpc_id = aws_vpc.example.id

  ingress = []
  egress  = []
}
```
