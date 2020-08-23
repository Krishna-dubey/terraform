resource "aws_eip" "eip" {
  vpc      = var.belongs_to_vpc
}