# data aws_ami
variable "ami_most_recent" {
  description = "most recent ami or not"
  type = bool
}

variable "ami_filter" {
  description = "filters for ami"
}

variable "ami_owners" {
  description = "list of owners of ami"
  type = list(string)
}



# module vpc
variable "vpc_cidr" {
    type = string
    description = "CIDR range for the VPC"
}

variable "vpc_tag_name" {
    type = string
    description = "Name tag for vpc"
    default = "20904_Krishna"
}

# module subnets
variable "params" {
  description = "list of maps which contains params for subnets"
}

# module my_igw
variable "igw_tag_name" {
  description = "value for name tag"
  type = string
}

# module public_ec2_sg
variable "public_ec2_sg_name" {
  description = "Name of security group"
  type = string
}

variable "public_ec2_sg_description" {
  description = "Description for security group"
  type = string
}

variable "public_ec2_ingress" {
  description = "ingress rules for security group"
}

variable "public_ec2_egress" {
  description = "ingress rules for security group"
}

# module public_route_table
variable "public_route_table_cidr" {
  description = "CIDR for route"
  type = string
}

variable "public_route_table_tag_name" {
  description = "Value for name tag"
  type = string
}

# module my_public_ec2
 variable "public_ec2_associate_public_ip_address" {
   description = "public ip required or not"
   type = bool
 }
 
 variable "public_ec2_instance_type" {
   description = "type of instance required"
   type = string
 }

 variable "public_ec2_key_name" {
   description = "name of the private key file"
   type = string
 }

 variable "public_ec2_iam" {
    description = "IAM role to be applied to the instance"
    type = string
  }

# module private_rds_sg
variable "private_rds_sg_name" {
  description = "Name of security group"
  type = string
}

variable "private_rds_sg_description" {
  description = "Description for security group"
  type = string
}

variable "private_rds_ingress" {
  description = "ingress rules for security group"
}

variable "private_rds_egress" {
  description = "ingress rules for security group"
}

# module private_rds_subnet_group
variable "subnet_group_name" {
  description = "name for the subnet group"
  type = string
}

# module my_pvt_rds
variable "allocated_storage" {
  description = "The allocated storage in gibibytes"
  type = number
}
variable "storage_type" {
  description = "storage type of db instance"
  type = string
}

variable "engine" {
  description = "Engine of db"
  type = string
}

variable "engine_version" {
  description = "engine version of db"
  type = string
}

variable "instance_class" {
  description = "instance class for db"
  type = string
}
variable "my_pvt_rds_name" {
  description = "name of db"
  type = string
}
variable "my_pvt_rds_username" {
  description = "username of db"
  type = string
}
variable "my_pvt_rds_password" {
  description = "password of db"
  type = string
}

variable "my_pvt_rds_availability_zone" {
  description = "availability zone of db"
  default     = "default"
}

variable "final_snapshot_skip" {
  description = "Final snapshot to keep or not"
  type = bool
}

# module private_ec2_sg
variable "private_ec2_sg_name" {
  description = "Name of security group"
  type = string
}

variable "private_ec2_sg_description" {
  description = "Description for security group"
  type = string
}

variable "private_ec2_ingress" {
  description = "ingress rules for security group"
}

variable "private_ec2_egress" {
  description = "ingress rules for security group"
}

# module nat_elastic_ip
variable "belongs_to_vpc" {
  description = "The generated elastic ip belongs to any VPC or not"
  type = bool
}

# module nat
variable "nat_tag_name" {
    description = "Value for the name tag"
    type = string
}

# module private_route_table
variable "private_route_table_cidr" {
  description = "CIDR for route"
  type = string
}

variable "private_route_table_tag_name" {
  description = "Value for name tag"
  type = string
}

# module my_private_ec2
variable "private_ec2_associate_public_ip_address" {
   description = "public ip required or not"
   type = bool
 }
 
variable "private_ec2_instance_type" {
  description = "type of instance required"
  type = string
}

variable "private_ec2_key_name" {
  description = "name of the private key file"
  type = string
}

variable "private_ec2_iam" {
  description = "IAM role to be applied to the instance"
  type = string
}