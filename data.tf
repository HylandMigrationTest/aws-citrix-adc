data "aws_vpc" "ss" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnet" "management_a" {
  filter {
    name   = "tag:Name"
    values = [var.management_subnet_names[0]]
  }
}

data "aws_subnet" "management_b" {
  filter {
    name   = "tag:Name"
    values = [var.management_subnet_names[1]]
  }
}