# data aws_ami
ami_most_recent = true
ami_filter = {
        "filter1" = { name = "owner-alias", values = ["amazon"] }
        "filter2" = { name = "name", values = ["amzn2-ami-hvm*"] }
    }
ami_owners = ["amazon"]

# module vpc
vpc_cidr = "10.0.0.0/16"
vpc_tag_name = "20904_Krishna_vpc"


# module subnets
params = {
        "public_subnet" = { cidr_block = "10.0.1.0/28", tag_name = "20904_pub_sub", availability_zone = "us-east-1a" },
        "private_subnet1" = { cidr_block = "10.0.2.0/26", tag_name = "20904_pvt_sub1", availability_zone = "us-east-1b" },
        "private_subnet2" = { cidr_block = "10.0.3.0/26", tag_name = "20904_pvt_sub2", availability_zone = "us-east-1c" }
        }

# module my_igw
igw_tag_name = "20904_Krishna_igw"

# module public_ec2_sg
public_ec2_sg_name = "20904_pub_ec2_sg"
public_ec2_sg_description = "Security group for public ec2 instance"
public_ec2_ingress = {
    "HTTP" = { from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    "HTTPS" = { from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    "SSH" = { from_port = 22, to_port = 22, protocol = "tcp" ,cidr_blocks = ["0.0.0.0/0"] },
}
public_ec2_egress = {
    "ALL" = { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"] }
}


# module public_route_table
public_route_table_cidr = "0.0.0.0/0"
public_route_table_tag_name = "20904_pub_sub_rt"

# module my_public_ec2
public_ec2_associate_public_ip_address = true
public_ec2_instance_type = "t2.micro"
public_ec2_key_name = "20904_Krishna"
public_ec2_iam = "FE-Fresher-EC2"

# module private_rds_sg
private_rds_sg_name = "20904_pvt_rds_sg"
private_rds_sg_description = "Security group for private rds instance"
private_rds_ingress = {
    "MySQL" = { from_port = 3306, to_port = 3306, protocol = "tcp", cidr_blocks = ["10.0.3.0/26"] },
    "SSH" = { from_port = 22, to_port = 22, protocol = "tcp" ,cidr_blocks = ["10.0.3.0/26"] },
}
private_rds_egress = {
    "HTTP" = { from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = ["10.0.3.0/26"] },
    "HTTPS" = { from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = ["10.0.3.0/26"] }
}

# module private_rds_subnet_group
subnet_group_name = "pvt-rds-sub-grp-20904"

# module my_pvt_rds
allocated_storage    = 20
storage_type         = "gp2"
engine               = "mysql"
engine_version       = "5.7"
instance_class       = "db.t2.micro"
my_pvt_rds_name      = "krishnadb"
my_pvt_rds_username  = "krishna"
my_pvt_rds_password  = "krishna123"
my_pvt_rds_availability_zone = "us-east-1b"
final_snapshot_skip = true

# module private_ec2_sg
private_ec2_sg_name = "20904_pvt_ec2_sg"
private_ec2_sg_description = "Security group for private ec2 instance"
private_ec2_ingress = {
    "HTTP" = { from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = ["10.0.0.0/16"] },
    "HTTPS" = { from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = ["10.0.0.0/16"] },
    "SSH" = { from_port = 22, to_port = 22, protocol = "tcp" ,cidr_blocks = ["10.0.0.0/16"] },
}
private_ec2_egress = {
    "ALL" = { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"] }
}

# module nat_elastic_ip
belongs_to_vpc = true

# module nat
nat_tag_name = "20904_nat"

# module private_route_table
private_route_table_cidr = "0.0.0.0/0"
private_route_table_tag_name = "20904_pvt_sub_rt"

# module my_private_ec2
private_ec2_associate_public_ip_address = false
private_ec2_instance_type = "t2.micro"
private_ec2_key_name = "20904_Krishna"
private_ec2_iam = "FE-Fresher-EC2"  