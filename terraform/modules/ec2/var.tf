 variable "ami" {
   description = "ami to attach"
   type = string
 }

 variable "associate_public_ip_address" {
   description = "public ip required or not"
   type = bool
 }
 
 variable "instance_type" {
   description = "type of instance required"
   type = string
 }

 variable "key_name" {
   description = "name of the private key file"
   type = string
 }

 variable "subnet_id" {
   description = "Id of subnet this instance belongs to"
   type = string
 }

 variable "sg_id_list" {
   description = "Id of security group to be attached"
   type = list(string)
 }
  variable "iam" {
    description = "IAM role to be applied to the instance"
    type = string
  }
  
  variable "depends_on_list" {
    description = "list of resources on which this ec2 depends"
    default     = []
  }
  
  variable "user_data" {
    description = "startup script for instance"
    default     = ""
  }
  
 
 
 
 
 
 