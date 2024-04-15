# resource "aws_cloudfront_origin_access_control" "cloudfront_ec2_oac" {
#   name                              = "ec2_oac"
#   description                       = "Example Policy"
#   origin_access_control_origin_type = "mediastore"
#   signing_behavior                  = "always"
#   signing_protocol                  = "sigv4"
# }

# resource "aws_cloudfront_distribution" "ec2_distribution" {
# #   origin {
# #     domain_name = aws_lb.Web_ALB.dns_name
# #     # origin_access_control_id = aws_cloudfront_origin_access_control.cloudfront_ec2_oac.id
# #     origin_id   = "Web_EC2_Hosting_Desktop" # Use ALB name for origin ID
# #   }
#   origin {
#     domain_name       = aws_lb.Web_ALB.dns_name
#     origin_id         = aws_lb.Web_ALB.dns_name
#     custom_origin_config {
#       http_port              = 80
#       https_port             = 443
#       origin_protocol_policy = "https-only"
#       origin_ssl_protocols   = ["TLSv1.2"]
#     }
#   }

#   enabled             = true
#   is_ipv6_enabled     = false
#   comment             = "CDN for web hosting"
# #   default_root_object = "index.html"

#   default_cache_behavior {
#     allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
#     cached_methods   = ["GET", "HEAD"]

#     target_origin_id = aws_lb.Web_ALB.dns_name # Use ALB name for target origin ID
#     # cache_policy_id  = aws_cloudfront_cache_policy.default.id
  
#     forwarded_values {
#       query_string = false

#       cookies {
#         forward = "none"
#       }
#     }

#     viewer_protocol_policy = "allow-all"
#     min_ttl                = 0
#     default_ttl            = 3600
#     max_ttl                = 86400
#   }

#   price_class = "PriceClass_200"

#   restrictions {
#     geo_restriction {
#       restriction_type = "none"
#       locations        = []
#     }
#   }

#   viewer_certificate {
#     cloudfront_default_certificate = true
#   }

#   # Ensure ALB is created before CloudFront distribution
#   depends_on = [aws_lb.Web_ALB]
# }
