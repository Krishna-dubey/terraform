variable "vpc_id" {
  description = "VPC id for route table"
  type = string
}

variable "route_cidr" {
  description = "CIDR for route"
  type = string
}

variable "tag_name" {
  description = "Value for name tag"
  type = string
}

variable "gateway_id" {
  description = "Id of internet gateway"
  type = string
}



