variable "name_prefix" {
  description = "Prefix for CloudFront resource names, typically project and environment"
  type        = string
}

variable "bucket_id" {
  description = "S3 bucket name, used to label the origin"
  type        = string
}

variable "bucket_regional_domain_name" {
  description = "S3 bucket regional domain name used as the origin"
  type        = string
}

variable "tags" {
  description = "Tags applied to all resources in this module"
  type        = map(string)
  default     = {}
}
