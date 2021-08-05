data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_security_group" "vpc" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  filter {
    name   = "group-name"
    values = ["default"]
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
    "hyl:splunk:type" = "indexer"
  }
}

data "aws_instances" "splunk_masters" {
  instance_tags = {
    "hyl:splunk:type" = "master_node"
  }
}

data "aws_instances" "splunk_loghosts" {
  instance_tags = {
    "hyl:splunk:type" = "loghost"
  }
}
