# Create S3 bucket
resource "aws_s3_bucket" "datacenter_bucket" {
  bucket = "datacenter-s3-15583-t4q2"

  tags = {
    Name = "datacenter-s3-15583-t4q2"
  }
}

# Disable block public access (required for public bucket)
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.datacenter_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Set bucket ACL to public-read
resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.datacenter_bucket.id
  acl    = "public-read"

  depends_on = [
    aws_s3_bucket_public_access_block.public_access
  ]
}