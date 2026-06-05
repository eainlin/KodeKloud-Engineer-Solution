resource "aws_s3_bucket" "wordpress_bucket" {
  bucket = "datacenter-s3-21854"
}

resource "aws_s3_bucket_acl" "wordpress_bucket_acl" {
  bucket = aws_s3_bucket.wordpress_bucket.id
  acl    = "private"
}

# New private S3 bucket
resource "aws_s3_bucket" "kke_bucket" {
  bucket = var.KKE_BUCKET
}

resource "aws_s3_bucket_acl" "kke_bucket_acl" {
  bucket = aws_s3_bucket.kke_bucket.id
  acl    = "private"
}

# Sync data from old bucket to new bucket
resource "null_resource" "s3_data_migration" {

  depends_on = [
    aws_s3_bucket.kke_bucket
  ]

  provisioner "local-exec" {
    command = "aws s3 sync s3://datacenter-s3-21854 s3://${var.KKE_BUCKET}"
  }
}