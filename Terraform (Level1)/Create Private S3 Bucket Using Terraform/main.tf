resource "aws_s3_bucket" "xfusion-s3-4665" {
  bucket = "xfusion-s3-4665"

  tags = {
    Name        = "xfusion-s3-4665"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.xfusion-s3-4665.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}