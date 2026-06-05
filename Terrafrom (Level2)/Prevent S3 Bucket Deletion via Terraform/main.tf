resource "aws_s3_bucket" "aws_s3" {
  bucket = var.KKE_BUCKET_NAME

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
