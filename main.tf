module "citrix_adc" {
  source  = "terraform.hylandcloud.com/Hyland-GCS/citrix-adc/aws"
  version = "0.3.4"

  ami_id                       = local.ami_ids[var.aws_region]
  availability_zones           = var.availability_zones
  aws_region                   = var.aws_region
  client_private_ips_count     = var.client_private_ips_count
  client_subnet_ids            = var.client_subnet_ids
  create_iam_resources         = var.create_iam_resources
  global_tags                  = var.global_tags
  iata_code                    = var.iata_code
  instance_count               = var.instance_count
  instance_type                = var.instance_type
  management_private_ips_count = var.management_private_ips_count
  management_subnet_ids        = var.management_subnet_ids
  public_key                   = var.public_key
  vpc_id                       = data.aws_vpc.ss.id

  root_block_device = {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
    encrypted   = true
  }
}

module "default_security_group_rules" {
  source  = "terraform.hylandcloud.com/Hyland-GCS/security-groups/aws"
  version = "1.4.1"

  aws_region   = var.aws_region
  service_name = "Citrix ADC"

  default_rules_enabled                        = true
  default_security_group_id                    = module.citrix_adc.management_security_group_id
  default_addc_source_security_group_id        = var.addc_security_group_id
  default_view_ip_ranges                       = var.view_cidr
  default_ansible_cidr_ranges                  = var.ansible_cidr
  default_ocdeploy_external_cidr               = var.ocdeploy_external_cidr
  default_ocdeploy_internal_cidr               = var.ocdeploy_internal_cidr
  default_sophos_ip_ranges                     = local.sophos_cidr
  default_ivanti_security_group_id             = var.ivanti_security_group_id
  default_postfix_cidr_blocks                  = local.postfix_cidr
  default_hostmon_cidr_blocks                  = local.hostmon_cidr
  default_certificate_authority_cidr_blocks    = var.certificate_authority_cidr
  default_splunk_indexer_cidr_blocks           = local.splunk_indexer_cidr
  default_splunk_master_cidr_blocks            = local.splunk_master_cidr
  default_splunk_loghost_cidr_blocks           = local.splunk_loghost_cidr
  default_splunk_deployment_server_cidr_blocks = var.splunk_deployment_server_cidr
}