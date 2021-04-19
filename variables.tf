# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables
# ---------------------------------------------------------------------------------------------------------------------

# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY

# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED MODULE PARAMETERS
# These variables must be passed in by the operator.
# ---------------------------------------------------------------------------------------------------------------------
variable "addc_security_group_id" {
  description = "The security group ID to use for default ADDC rules."
  type        = string
}

variable "availability_zones" {
  description = "The list of AZs for resources."
  type        = list(string)
}

variable "aws_region" {
  description = "The AWS region in which all resources will be created."
  type        = string
}

variable "client_subnet_ids" {
  description = "The list of subnet IDs to use for the Client Network."
  type        = list(string)
}

variable "iata_code" {
  description = "The IATA code corresponding to the region."
  type        = string
}

variable "ivanti_security_group_id" {
  description = "The security group ID to use for default Ivanti rules."
  type        = string
}

variable "management_subnet_ids" {
  description = "The list of subnet IDs to use for the Management Network."
  type        = list(string)
}

variable "public_key" {
  description = "The public key for the instance(s)."
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL MODULE PARAMETERS
# These variables have defaults, but may be overridden by the operator.
# ---------------------------------------------------------------------------------------------------------------------
variable "ansible_cidr" {
  description = "The list of CIDR blocks for Ansible security group rules."
  type        = list(string)
  default     = ["10.210.0.31/32"]
}

variable "certificate_authority_cidr" {
  description = "The list of CIDR blocks for CA security group rules."
  type        = list(string)
  default     = ["10.220.0.131/32"]
}

variable "client_private_ips_count" {
  description = "The number of secondary private IPs for the Client Interface."
  type        = number
  default     = 1
}

variable "create_iam_resources" {
  description = "Flag to enable the creation of cross-region IAM resources."
  type        = bool
  default     = false
}

variable "global_tags" {
  description = "The tags to apply to all resources."
  type        = map(string)
  default     = {}
}

variable "instance_count" {
  description = "The number of instances to create."
  type        = number
  default     = 2
}

variable "instance_type" {
  description = "The size (type) for the instance(s)."
  type        = string
  default     = "m5.large"
}

variable "management_private_ips_count" {
  description = "The number of secondary private IPs for the Management Interface."
  type        = number
  default     = 1
}

variable "ocdeploy_external_cidr" {
  description = "The list of OCDeploy external CIDR blocks for security group rules."
  type        = list(string)
  default     = ["74.214.17.82/32"]
}

variable "ocdeploy_internal_cidr" {
  description = "The list of OCDeploy internal CIDR blocks for security group rules."
  type        = list(string)
  default     = ["10.210.0.131/32", "10.152.2.35/32", "10.152.2.36/32", "10.210.0.130/32"]
}

variable "root_volume_size" {
  description = "The size (in GB) of the instance(s) root volume."
  type        = number
  default     = 30
}

variable "root_volume_type" {
  description = "The type of the instance(s) root volume."
  type        = string
  default     = "gp2"
}

variable "splunk_deployment_server_cidr" {
  description = "The list of CIDR blocks for Splunk Deployment Server security group rules."
  type        = list(string)
  default     = ["10.198.2.62/32", "10.198.2.73/32"]
}

variable "view_cidr" {
  description = "The list of CIDR blocks for View security group rules."
  type        = list(string)
  default     = ["10.184.201.0/24", "10.198.36.0/23"]
}

variable "vpc_name" {
  description = "The name of the VPC to use for all resources."
  type        = string
  default     = "ns"
}