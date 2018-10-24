# Dynect to Route53 NS forwarding terraform module

Terraform module which creates a hosted zone in AWS Route 53, and NS records in Dyn
to forward DNS requests for a given domain to the new hosted zone.

## Usage

```hcl
module "forward-zone" {
  source = "heroku/terraform-dyn-to-route53-forward"
  forward_domain = "forward.me.mydomain.com"
  root_domain = "mydomain.com"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| forward_domain | Domain to be forwarded. eg: 'forward.me.mydomain.com' | string | - | yes |
| name_servers_count | Number of nameservers for a route53 hosted zone. Necessary because of https://github.com/hashicorp/terraform/issues/10857#issuecomment-368059147 | string | `4` | no |
| root_domain | Domain containing the subdomain to be forwarded. eg: 'mydomain.com' | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| name_servers | Nameservers for the route53 zone |
| zone_id | ID of the route53 zone |

