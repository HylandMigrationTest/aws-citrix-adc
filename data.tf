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

data "aws_ami" "citrix_adc" {
  owners      = ["aws-marketplace"]
  most_recent = true

  filter {
    name   = "name"
    values = ["Citrix ADC 13.0-76.31-64-*"]
  }
}