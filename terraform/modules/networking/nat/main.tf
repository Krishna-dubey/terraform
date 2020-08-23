resource "aws_nat_gateway" "nat" {
  allocation_id = var.eip_id
  subnet_id     = var.subnet_id
  depends_on = [var.depends_on_list]
  tags = {
    Name = var.tag_name
  }
}