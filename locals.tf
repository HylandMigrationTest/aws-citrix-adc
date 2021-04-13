locals {
  management_subnet_ids = list(data.aws_subnet.management_a.id, data.aws_subnet.management_b.id)
}