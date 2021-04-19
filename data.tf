data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_instances" "sophos" {
  instance_tags = {
    "hyl:infra:type" = "SophosUTM"
  }
}

data "aws_instances" "postfix" {
  instance_tags = {
    "hyl:infra:type" = "postfix"
  }
}

data "aws_instances" "hostmon" {
  instance_tags = {
    "hyl:infra:type" = "hostmon"
  }
}

data "aws_instances" "splunk_indexers" {
  instance_tags = {
    "hyl:infra:type" = "splunk:indexer"
  }
}

data "aws_instances" "splunk_masters" {
  instance_tags = {
    "hyl:infra:type" = "splunk:master"
  }
}

data "aws_instances" "splunk_loghosts" {
  instance_tags = {
    "hyl:infra:type" = "splunk:loghost"
  }
}