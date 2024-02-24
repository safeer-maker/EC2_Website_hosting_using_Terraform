# EC2_Website_hosting_using_Terraform
Host static website on Ec2 server. The IAC is written on Terraform

The motive is to write different sub modules and then link them togethher to make an EC2 base Web site hosting site.
The website and its accets is stored on S3 bucket. Ec2 will get data using IAM role.

The EC2 is not bublically availabe so the cloud fornt get ec2 data and host the web.

## Modular steps by click ops

VPC
- create vpc my giving name and CIDR IP4.
- Create sub net
    * chose VPC ID, Sub net name, az, CIDR ip for subnet
- Create Internet gateway
    * Attach internet gateway to VPC
- Create Routing table 
    * Name of routing table, Chose VPC
    * Make subnet association with routing table 
    * Edit route and attach Internet gatewasy and provide destination
- Create a security Group
    * Name of security Group, add description
    * Outbond Rule chose type=http, destination= anyware ipv4

EC2
 - Create Key pair

 - Launch and Instance
    * Name of instance
    * AMI of Instance
    * Instance Type
    * Key pair
    * Network settings
        + chose vpc
        + chose subnet
        + Auto assign public IP **
        + select Security Group
        + add user data 


S3



Cloudfront

