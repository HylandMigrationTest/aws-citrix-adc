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
variable "availability_zones" {
  description = "The list of AZs for resources."
  type        = list(string)
}

variable "aws_region" {
  description = "The AWS region in which all resources will be created."
  type        = string
}

variable "iata_code" {
  description = "The IATA code corresponding to the region."
  type        = string
}

variable "management_subnet_names" {
  description = "The list of names of subnets to use for the Management Network."
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
  default     = 2
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

variable "vpc_name" {
  description = "The name of the VPC to use for all resources."
  type        = string
  default     = "ss"
}