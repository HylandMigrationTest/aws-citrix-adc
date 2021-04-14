module "citrix_adc" {
  source  = "terraform.hylandcloud.com/Hyland-GCS/citrix-adc/aws"
  version = "0.2.0"

  ami_id                       = local.ami_ids[var.aws_region]
  availability_zones           = var.availability_zones
  aws_region                   = var.aws_region
  create_iam_resources         = var.create_iam_resources
  global_tags                  = var.global_tags
  iata_code                    = var.iata_code
  instance_count               = var.instance_count
  instance_type                = var.instance_type
  management_private_ips_count = var.management_private_ips_count
  management_subnet_ids        = local.management_subnet_ids
  public_key                   = var.public_key
  vpc_id                       = data.aws_vpc.ss.id

  root_block_device = {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
    encrypted   = true
  }
}