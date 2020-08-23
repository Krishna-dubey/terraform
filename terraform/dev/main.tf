#---------------------------
# Data sources
#---------------------------

# Creating Amazon linux 2 ami data source to get latest updated OS.
data "aws_ami" "amazon-linux-2" {
 most_recent = var.ami_most_recent

 dynamic "filter" {
        for_each = var.ami_filter
        content {
            name   = filter.value.name
            values = filter.value.values
        }
    }
 owners = var.ami_owners
}

#----------------------------
# Modules
#----------------------------

# 1. VPC
module "vpc" {
    source = "../modules/networking/vpc"
    vpc_cidr = var.vpc_cidr
    tag_name = var.vpc_tag_name
}

# 2. subnets
module "subnets" {
    source = "../modules/networking/subnet"
    params = var.params
    vpc_id = module.vpc.vpc_id
}

# 3. Internet gateway for VPC to access internet
module "my_igw" {
    source = "../modules/networking/igw"
    vpc_id = module.vpc.vpc_id
    tag_name = var.igw_tag_name
}

#----------------------------
# For EC2 in public subnet
#----------------------------

# 4. Security group for public ec2 instance
module "public_ec2_sg" {
    source = "../modules/networking/security_group"
    vpc_id = module.vpc.vpc_id
    sg_name = var.public_ec2_sg_name
    sg_description = var.public_ec2_sg_description
    ingress = var.public_ec2_ingress
    egress = var.public_ec2_egress
}

# 5. Route table for public subnet
module "public_route_table" {
    source = "../modules/networking/route_table"
    vpc_id = module.vpc.vpc_id
    route_cidr = var.public_route_table_cidr
    gateway_id = module.my_igw.igw_id
    tag_name = var.public_route_table_tag_name
}

# 6. Route table association for public subnet
module "public_route_table_association"{
    source = "../modules/networking/route_table_association"
    subnet_id = module.subnets.subnet["20904_pub_sub"]
    route_table_id = module.public_route_table.route_table_id
}

# 7. Public ec2 instance
module "my_public_ec2" {
    source = "../modules/ec2"
    ami = "${data.aws_ami.amazon-linux-2.id}"
    associate_public_ip_address = var.public_ec2_associate_public_ip_address
    instance_type = var.public_ec2_instance_type
    key_name = var.public_ec2_key_name
    subnet_id = module.subnets.subnet["20904_pub_sub"]
    sg_id_list = [module.public_ec2_sg.sg_id]
    iam = var.public_ec2_iam  
}


#----------------------------
# For RDS in private subnet-1 
#----------------------------
# 8. Security group for RDS in private subnet-1
module "private_rds_sg" {
    source = "../modules/networking/security_group"
    vpc_id = module.vpc.vpc_id
    sg_name = var.private_rds_sg_name
    sg_description = var.private_rds_sg_description
    ingress = var.private_rds_ingress
    egress = var.private_rds_egress
}

# 9. Subnet group for RDS instance for multi AZ
module "private_rds_subnet_group" {
    source = "../modules/subnet_group"
    subnet_group_name = var.subnet_group_name
    subnet_ids_list = [module.subnets.subnet["20904_pvt_sub1"],module.subnets.subnet["20904_pvt_sub2"]]
}

# 10. MySQL RDS in private subnet-1 
module "my_pvt_rds" {
    source = "../modules/rds"
    allocated_storage    = var.allocated_storage
    storage_type         = var.storage_type
    engine               = var.engine
    engine_version       = var.engine_version
    instance_class       = var.instance_class
    name                 = var.my_pvt_rds_name
    username             = var.my_pvt_rds_username
    password             = var.my_pvt_rds_password
    db_subnet_group_name = module.private_rds_subnet_group.subnet_group_name
    vpc_security_group_id_list =[module.private_rds_sg.sg_id]
    availability_zone = var.my_pvt_rds_availability_zone
    final_snapshot_skip = var.final_snapshot_skip
}

#----------------------------
# For EC2 in private subnet-2
#----------------------------
# 11. Security group for private EC2 instance
module "private_ec2_sg" {
    source = "../modules/networking/security_group"
    vpc_id = module.vpc.vpc_id
    sg_name = var.private_ec2_sg_name
    sg_description = var.private_ec2_sg_description
    ingress = var.private_ec2_ingress
    egress = var.private_ec2_egress
}

# 12. Elastic IP for NAT instance
module "nat_elastic_ip" {
    source = "../modules/networking/elastic_ip"
    belongs_to_vpc = var.belongs_to_vpc
}

# 13. NAT insatance for private EC2 to connect to internet
module "nat" {
    source = "../modules/networking/nat"
    eip_id = module.nat_elastic_ip.eip_id
    subnet_id = module.subnets.subnet["20904_pub_sub"]
    depends_on_list = [module.my_igw]
    tag_name = var.nat_tag_name
}

# 14. Route table for private subnet
module "private_route_table" {
    source = "../modules/networking/route_table"
    vpc_id = module.vpc.vpc_id
    route_cidr = var.private_route_table_cidr
    gateway_id = module.nat.nat_id
    tag_name = var.private_route_table_tag_name
}

# 15. Route table association for private subnet
module "private_route_table_association"{
    source = "../modules/networking/route_table_association"
    subnet_id = module.subnets.subnet["20904_pvt_sub2"]
    route_table_id = module.private_route_table.route_table_id
}

# 16. EC2 instance in private subnet-2
module "my_private_ec2" {
    source = "../modules/ec2"
    ami = "${data.aws_ami.amazon-linux-2.id}"
    associate_public_ip_address = var.private_ec2_associate_public_ip_address
    instance_type = var.private_ec2_instance_type
    key_name = var.private_ec2_key_name
    subnet_id = module.subnets.subnet["20904_pvt_sub2"]
    sg_id_list = [module.private_ec2_sg.sg_id]
    iam = var.private_ec2_iam  
    depends_on_list = [module.my_pvt_rds,module.nat]
    user_data = "${file("user_data.sh")}"
}
