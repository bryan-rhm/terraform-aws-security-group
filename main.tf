resource "aws_security_group" "this" {
  name_prefix            = var.name
  description            = var.description
  vpc_id                 = var.vpc_id
  revoke_rules_on_delete = true
  tags                   = merge({ Name = var.name }, var.tags)
}

resource "aws_security_group_rule" "rule" {
  count                    = length(var.rules)
  type                     = var.rules[count.index].type
  to_port                  = var.rules[count.index].to_port
  from_port                = var.rules[count.index].from_port
  protocol                 = var.rules[count.index].protocol
  self                     = try(var.rules[count.index].self, null)
  cidr_blocks              = try(var.rules[count.index].cidr_blocks, null)
  description              = try(var.rules[count.index].description, null)
  prefix_list_ids          = try(var.rules[count.index].prefix_list_ids, null)
  security_group_id        = aws_security_group.this.id
  source_security_group_id = try(var.rules[count.index].source_security_group_id, null)
}
