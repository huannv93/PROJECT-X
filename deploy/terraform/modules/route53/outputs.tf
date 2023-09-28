output "app_route53_record_api" {
  value = "${aws_route53_record.app.name}.${var.hosted_zone}"
}

output "app_route53_record_website" {
  value = "${aws_route53_record.website-a-record.name}.${var.hosted_zone}"
}