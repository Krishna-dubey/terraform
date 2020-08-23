variable "vpc_id" {
  description = "VPC id to which this security group belongs to"
  type = string
}

variable "sg_name" {
  description = "Name of security group"
  type = string
}

variable "sg_description" {
  description = "Description for security group"
  type = string
}

variable "ingress" {
  description = "ingress rules for security group"
}

variable "egress" {
  description = "ingress rules for security group"
}



