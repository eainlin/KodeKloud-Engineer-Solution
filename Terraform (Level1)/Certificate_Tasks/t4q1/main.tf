# Create S3 bucket
resource "aws_s3_bucket" "datacenter_bucket" {
  bucket = "datacenter-s3-15583-t4q1"

  tags = {
    Name = "datacenter-s3-15583-t4q1"
  }
}

# Block all public access (make bucket private)
resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.datacenter_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}