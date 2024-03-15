# EC2 Instance

[EC2 instance in terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#argument-reference) requires vpc setting like subnets and security group. Your then in ec2 insance but as I have created VPC in terraform. We need to pass those VPC id's to ec2 module.

```go
resource "aws_instance" "example" {
  ami           = "ami-0440d*********"
  instance_type = "t*.m***"
  subnet_id     =  var.subnet_1_id
  vpc_security_group_ids = [var.security_group_h]

}
```

Subnet id and vpc security group id need for ec2 createion.

> An Ec2 isnstance can contain multiple security groups. So it has to be list.

## Sub Modules Variable transfer

Modules needs to pass data information or iam of resources created by a module/sub-module. As sub modules are isolated with each other, the best way to pass data is to output id's or ami's from source module.

```go
# Output form source module 
output "vpc_id"{
    value = aws_vpc.vpc.id
}

# Main module 
## Defining vpc in main to get output
module "vpc" {
    source = "./modules/vpc"
}
## Passing vpc id to ec2
module "ec2" {
    source = "./modules/ec2"
    vpc_id = module.vpc.vpc_id
}

# Input to ec2
resource "aws_instance" "ec2_t2.micro" {
  vpc     =  var.vpc_id
}
```

> This is an example code dont use it.

## Assigning Public IP Address

Terraform will not assign public ip address be default. `public_ip = true` will not do any good. To assign public ip `associate_public_ip_address = true`.

## User Data to EC2

User data can be passed to ec2 instance by directely passing the code

```go 
user_data = <<-EOF
              #!/bin/bash
              # Use this for your user data (script from top to bottom)
              # install httpd (Linux 2 version)
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello Safeer Ahmad from $(hostname -f)</h1>" > /var/www/html/index.html
              EOF
```

The sh file can also be passed to load the script.
`user_data = file("${path.module}/script.sh")`

# Web hosting

Ec2 isnatnce is set to host a web side from an s3 bucket. the bucket is not public at all.
To overcome this task I have uploaded the index.html file to s3 bucket.
The user data on creation of ec2 is used to fetch index.html file and stat web server usign httpd

```bash
#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
aws s3 sync s3://${var.bucket_name}/web ./web
cp web/index.html /var/www/html/index.html
systemctl restart httpd
```

> You can pass ec2 user data in inline code. or can use a file to pass the user code. 


