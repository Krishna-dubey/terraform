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
 variable "name" {
   description = "name of db"
   type = string
 }
 variable "username" {
   description = "username of db"
   type = string
 }
 variable "password" {
   description = "password of db"
   type = string
 }

  variable "db_subnet_group_name" {
   description = "name of subnet group for db"
   type = string
 }

 variable "vpc_security_group_id_list" {
   description = "list of security group id in a VPC"
   default     = "default"
 }

 variable "availability_zone" {
   description = "availability zone of db"
   default     = "default"
 }

 variable "final_snapshot_skip" {
   description = "Final snapshot to keep or not"
   type = bool
 }
 
 
 
 