resource "aws_s3_bucket" "my_bucket" {
  bucket = "xfusion-cp-24176"
  acl    = "private"

  tags = {
    Name        = "xfusion-cp-24176"
  }
}

resource "aws_s3_object" "upload" {
  bucket = "xfusion-cp-24176"
  key    = "xfusion.txt"
  source = "/tmp/xfusion.txt"

  etag = filemd5("/tmp/xfusion.txt")
}