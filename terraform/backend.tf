# Remote state backend.
#
# Bootstrap order:
#   1. Run `terraform init` with this block commented out (local state).
#   2. Create the state bucket and lock table (or create them out-of-band),
#      then uncomment the block below.
#   3. Run `terraform init -migrate-state` to move local state into S3.
#
# Bucket names must be globally unique; replace the placeholder values.
#
# terraform {
#   backend "s3" {
#     bucket         = "your-terraform-state-bucket"
#     key            = "portfolio-site/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-state-lock"
#     encrypt        = true
#   }
# }
