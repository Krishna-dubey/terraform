resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.route_cidr
    gateway_id = var.gateway_id
  }
  tags = {
    Name = var.tag_name
  }
}