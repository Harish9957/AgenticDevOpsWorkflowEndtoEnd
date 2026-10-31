variable "bucket_name" {
  description = "Globally unique, lowercase S3 bucket name"
  type        = string
}

variable "account_id" {
  description = "AWS account ID, used to scope the CloudFront read policy"
  type        = string
}

variable "tags" {
  description = "Tags applied to all resources in this module"
  type        = map(string)
  default     = {}
}
