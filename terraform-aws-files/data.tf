 data "aws_route53_zone" "binbashblog_private_hosted_zone" {
 vpc_id       = "${var.binbashblog_vpc.id}"
 name         = "${var.private_hosted_zone_name}"
 private_zone = true
}

resource "aws_eip" "binbashblog_eip" {
 instance = "${aws_instance.binbashblog_ec2_instance.id}"
 vpc      = true
}

resource "aws_route53_record" "binbashblog_hosted_zone_entry" {
 zone_id = "${data.aws_route53_zone.binbashblog_private_hosted_zone.id}"
 name    = "subdomain.binbashblog"
 type    = "A"
 ttl     = "300"
 records = ["${aws_eip.binbashblog_eip.public_ip}"]
}
