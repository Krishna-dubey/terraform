resource "aws_instance" "my_ec2" {
 ami                         = var.ami
 associate_public_ip_address = var.associate_public_ip_address
 instance_type               = var.instance_type
 key_name                    = var.key_name
 subnet_id                   = var.subnet_id
 vpc_security_group_ids      = var.sg_id_list
 iam_instance_profile        = var.iam
 depends_on                  = [var.depends_on_list]
 user_data                   = var.user_data
}