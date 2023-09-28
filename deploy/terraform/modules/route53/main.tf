data "aws_route53_zone" "selected" {
  name = var.hosted_zone
}

resource "aws_route53_record" "app" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "api-${var.project_name}"
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "website-a-record" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = ""
  type    = "A"
  alias {
    name                   = var.cloudfront_dns_name  #aws_cloudfront_distribution.this.domain_name
    zone_id                = var.cloudfront_zone_id #aws_cloudfront_distribution.this.hosted_zone_id
    evaluate_target_health = false
  }
}



