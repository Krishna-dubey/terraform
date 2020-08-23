variable "eip_id" {
  description = "Id of elastic ip address"
  type = string
}

variable "subnet_id" {
  description = "Id of subnet to which nat belongs to"
  default     = "default"
}

variable "depends_on_list" {
  description = "List of resources on which NAT depends"
}

variable "tag_name" {
    description = "Value for the name tag"
    type = string
}
