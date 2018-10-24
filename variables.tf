variable "root_domain" {
  type        = "string"
  description = "Domain containing the subdomain to be forwarded. eg: 'mydomain.com'"
}

variable "forward_domain" {
  type        = "string"
  description = "Domain to be forwarded. eg: 'forward.me.mydomain.com'"
}

variable "name_servers_count" {
  type        = "string"
  default     = "4"
  description = "Number of nameservers for a route53 hosted zone. Necessary because of https://github.com/hashicorp/terraform/issues/10857#issuecomment-368059147"
}
