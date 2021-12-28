# Terraform AWS Security group module

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.43.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.43.0 |

## Resources

| Name | Type |
|------|------|
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Description for the security group | `string` | `"Created by terraform"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the security group | `string` | n/a | yes |
| <a name="input_rules"></a> [rules](#input\_rules) | Ingress/Egress rules to apply to the security group | <pre>list(object({<br>    type            = string<br>    from_port                = number<br>    to_port                  = number<br>    protocol                 = string<br>    self                     = optional(bool)<br>    description              = optional(string)<br>    cidr_blocks              = optional(list(string))<br>    prefix_list_ids          = optional(list(string))<br>    source_security_group_id = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags to assign to the resource. | `map(any)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Id of the vpc where the security group will be created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_output"></a> [output](#output\_output) | Security group attributes |
