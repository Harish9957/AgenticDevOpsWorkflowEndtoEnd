# Remote state backend: S3 bucket with versioning and encryption, locked
# via the DynamoDB table `terraform-state-lock`. Both were created
# out-of-band (bootstrap) in us-east-1.

terraform {
  backend "s3" {
    bucket         = "agwe2e-tfstate"
    key            = "portfolio-site/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
