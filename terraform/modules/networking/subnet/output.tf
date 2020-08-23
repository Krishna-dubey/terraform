output "subnet" {
    value = { for subnet in aws_subnet.my_subnet: subnet.tags["Name"]=>subnet.id}
}
