locals {
  forward_name1 = "${replace("${var.forward_domain}", "${var.root_domain}", "")}"
  forward_name  = "${substr("${local.forward_name1}", 0, length("${local.forward_name1}") - 1)}"
}

resource "aws_route53_zone" "main" {
  name = "${var.forward_domain}"
}

resource "dyn_record" "forward" {
  count = "${var.name_servers_count}"
  name  = "${local.forward_name}"
  zone  = "${var.root_domain}"
  type  = "NS"
  value = "${aws_route53_zone.main.name_servers[count.index]}"
}
