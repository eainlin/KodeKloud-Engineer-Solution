resource "aws_s3_bucket" "bucket" {
  bucket = var.KKE_BUCKET_NAME

  lifecycle {
    prevent_destroy = true
  }
}