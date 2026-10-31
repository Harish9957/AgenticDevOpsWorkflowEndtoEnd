resource "aws_s3_bucket" "site" {
  bucket = var.bucket_name

  tags = var.tags
}

resource "aws_s3_bucket_public_access_block" "site" {
  bucket = aws_s3_bucket.site.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Grants read access to the CloudFront service only. Scoped to this account via
# AWS:SourceAccount rather than the distribution ARN, because the distribution
# depends on this bucket's domain name and a module-level cycle is not allowed.
resource "aws_s3_bucket_policy" "site" {
  bucket = aws_s3_bucket.site.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowCloudFrontOACRead"
        Effect    = "Allow"
        Principal = { Service = "cloudfront.amazonaws.com" }
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.site.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceAccount" = var.account_id
          }
        }
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.site]
}
