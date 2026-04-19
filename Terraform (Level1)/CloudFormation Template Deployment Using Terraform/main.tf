resource "aws_cloudformation_stack" "datacenter-stack" {
  name = "datacenter-stack"

  template_body = <<STACK
{
  "AWSTemplateFormatVersion": "2010-09-09",
  "Resources": {
    "S3Bucket": {
      "Type": "AWS::S3::Bucket",
      "Properties": {
        "BucketName": "datacenter-bucket-22198",
        "VersioningConfiguration": {
          "Status": "Enabled"
        }
      }
    }
  }
}
STACK
}