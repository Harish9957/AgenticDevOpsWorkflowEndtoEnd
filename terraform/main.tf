data "aws_caller_identity" "current" {}

locals {
  name_prefix = lower("${var.project_name}-${var.environment}")

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

module "s3" {
  source = "./modules/S3"

  # S3 bucket names must be lowercase and globally unique.
  bucket_name = lower("${local.name_prefix}-${data.aws_caller_identity.current.account_id}")
  account_id  = data.aws_caller_identity.current.account_id
  tags        = local.tags
}

module "cloudfront" {
  source = "./modules/CloudFront"

  name_prefix                 = local.name_prefix
  bucket_id                   = module.s3.bucket_id
  bucket_regional_domain_name = module.s3.bucket_regional_domain_name
  tags                        = local.tags
}

module "security_group" {
  source = "./modules/SecurityGroup"

  name_prefix  = local.name_prefix
  allowed_cidr = var.allowed_cidr
  ingress_port = var.ingress_port
  tags         = local.tags
}
