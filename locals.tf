locals {
  ami_ids = {
    "us-west-2"      = "ami-0503d15aed657c87d"
    "us-west-1"      = "ami-0707f52c208d83427"
    "us-east-2"      = "ami-0e8e26c508fa94732"
    "us-east-1"      = "ami-0bb96d1f8f79db909"
    "sa-east-1"      = "ami-0c66fc6fff94c64b9"
    "eu-west-3"      = "ami-0bd4c025bd6afab4a"
    "eu-west-2"      = "ami-037b51b95111f4231"
    "eu-west-1"      = "ami-023da45cff4446484"
    "eu-north-1"     = "ami-01672d9e4fd60f85d"
    "eu-central-1"   = "ami-05d81856537a0cfc2"
    "ca-central-1"   = "ami-02cbae7662e592d24"
    "ap-southeast-2" = "ami-02098e6dfe08d9299"
    "ap-southeast-1" = "ami-0316840d86abe4e5e"
    "ap-south-1"     = "ami-027978a22dc893058"
    "ap-northeast-2" = "ami-0ad520c016e96f260"
    "ap-northeast-1" = "ami-0a5d628c2e1ea45e9"
  }

  sophos_cidr         = [for ip in data.aws_instances.sophos.private_ips : "${ip}/32"]
  postfix_cidr        = [for ip in data.aws_instances.postfix.private_ips : "${ip}/32"]
  hostmon_cidr        = [for ip in data.aws_instances.hostmon.private_ips : "${ip}/32"]
  splunk_indexer_cidr = [for ip in data.aws_instances.splunk_indexers.private_ips : "${ip}/32"]
  splunk_master_cidr  = [for ip in data.aws_instances.splunk_masters.private_ips : "${ip}/32"]
  splunk_loghost_cidr = [for ip in data.aws_instances.splunk_loghosts.private_ips : "${ip}/32"]
}