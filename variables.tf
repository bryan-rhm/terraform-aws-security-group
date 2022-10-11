variable "name" {
  description = "Name for the security group"
  type        = string
}

variable "vpc_id" {
  description = "Id of the vpc where the security group will be created"
  type        = string
}

variable "description" {
  description = "Description for the security group"
  default     = "Created by terraform"
  type        = string
}

variable "rules" {
  description = "Ingress/Egress rules to apply to the security group"
  default     = []
  type = list(object({
    type            = string
    from_port                = number
    to_port                  = number
    protocol                 = string
    self                     = optional(bool)
    description              = optional(string)
    cidr_blocks              = optional(list(string))
    prefix_list_ids          = optional(list(string))
    source_security_group_id = optional(string)
  }))
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Map of tags to assign to the resource. "
}
