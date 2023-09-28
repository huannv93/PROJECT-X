variable "hosted_zone" {
  description = "Name of hosted zone on route53"
}
variable "alb_dns_name" {
  description = "dns endpoint of alb backend x api"
}
variable "alb_zone_id" {
  description = "alb zone id of alb backend x api"
}
variable "project_name" {
  description = "project name"
}
variable "cloudfront_dns_name" {
  description = "dns endpoint of cloudfront"
}
variable "cloudfront_zone_id" {
  description = "zone of cloudfront"
}