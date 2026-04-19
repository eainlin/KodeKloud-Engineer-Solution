resource "aws_s3_bucket" "s3_ran_bucket" {
  bucket = "xfusion-s3-32104"
  

  tags = {
    Name        = "xfusion-s3-32104"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.s3_ran_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.s3_ran_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}