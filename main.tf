module "citrix_adc" {
  source  = "terraform.hylandcloud.com/Hyland-GCS/citrix-adc/aws"
  version = "0.1.0"

  ami_id                       = data.aws_ami.citrix_adc
  availability_zones           = var.availability_zones
  aws_region                   = var.aws_region
  global_tags                  = var.global_tags
  iata_code                    = var.iata_code
  instance_count               = var.instance_count
  instance_type                = var.instance_type
  management_private_ips_count = var.management_private_ips_count
  management_subnet_ids        = local.management_subnet_ids
  vpc_id                       = data.aws_vpc.ss.id

  root_block_device = {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
    encrypted   = true
  }
}