variable "subnet_group_name" {
  description = "name for the subnet group"
  type = string
}

variable "subnet_ids_list" {
  description = "list of ids of subnet"
  type = list(string)
}

