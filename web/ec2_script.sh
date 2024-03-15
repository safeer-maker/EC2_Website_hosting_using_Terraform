#!/bin/bash
# yum update -y
# # yum install -y httpd

# # # fetching web data from s3 bucket
# # aws s3 sync s3://safeer-aws-cli-bucket-1234 ./web-server
# # cd web-server

# # yum install -y nodejs npm 
# # sudo npm install -g http-server

# sudo yum install nginx

# aws s3 sync s3://safeer-aws-cli-bucket-1234 ./web

# cp /web/index.html /var/www/html/index.html

# # starting the web server
# sudo systemctl start nginx

##########################

#!/bin/bash
# yum update -y
# yum install -y httpd
# aws s3 sync s3://safeer-aws-cli-bucket-1234 ./web
# cp web/index.html /var/www/html/index.html
# systemctl start httpd

##############################
              # #!/bin/bash
              # # Use this for your user data (script from top to bottom)
              # # install httpd (Linux 2 version)
              # yum update -y
              # yum install -y httpd
              # # systemctl start httpd
              # # systemctl enable httpd
              # # echo "<h1>Hello Safeer Ahmad from $(hostname -f)</h1>" > /var/www/html/index.html
              # sudo yum install nginx -y
              # sudo systemctl start nginx
              # aws s3 sync s3://safeer-aws-cli-bucket-1234 ./web
              # cp /web/index.html /var/www/html/index.html


#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
aws s3 sync s3://${var.bucket_name}/web /var/www/html/
systemctl restart httpd



              # #!/bin/bash
              # yum update -y
              # yum install -y httpd
              # systemctl start httpd
              # systemctl enable httpd
              # aws s3 sync s3://${var.bucket_name}/web /var/www/html/
              # systemctl restart httpd

              #!/bin/bash
              # Use this for your user data (script from top to bottom)
              # install httpd (Linux 2 version)
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html