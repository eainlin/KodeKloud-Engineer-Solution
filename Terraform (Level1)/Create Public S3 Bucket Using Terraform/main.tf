resource "aws_s3_bucket" "nautilus-s3-28127" {
  bucket = "nautilus-s3-28127"

  tags = {
    Name        = "nautilus-s3-28127"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.nautilus-s3-28127.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "public_read_policy" {
  bucket = aws_s3_bucket.nautilus-s3-28127.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = ["s3:GetObject"]
        Resource  = "${aws_s3_bucket.nautilus-s3-28127.arn}/*"
      }
    ]
  })
}