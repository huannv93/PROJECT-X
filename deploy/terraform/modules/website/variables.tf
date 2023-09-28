variable "aws_region" {
  description = "The AWS region things are created in"
}
variable "website_bucket_name" {
  description = "The bucket name of the frontend static website"
}
variable "acm_certificate_arn" {
  description = "ARN of ACM SSL certificate in us-east-1 region"
}

variable "bucket_log_cf" {
  description = "bucket name store logs cloudfront"
}
variable "waf_arn" {
  description = "ARN of AWS WAF ID"
}