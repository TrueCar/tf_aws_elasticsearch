resource "aws_route53_record" "elasticsearch" {
  zone_id = "${var.route53_zone_id}"
  name    = "${var.record_name}"
  type    = "A"

  alias {
    name                   = "${aws_elb.elasticsearch.dns_name}"
    zone_id                = "${aws_elb.elasticsearch.zone_id}"
    evaluate_target_health = true
  }
}
