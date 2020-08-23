variable "vpc_cidr" {
    type = string
    description = "CIDR range for the VPC"
}

variable "tag_name" {
    type = string
    description = "Name tag for vpc"
    default = "20904_Krishna"
}

