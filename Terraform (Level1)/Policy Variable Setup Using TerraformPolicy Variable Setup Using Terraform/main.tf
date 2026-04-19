resource "aws_iam_policy" "new_policy" {
    name = var.KKE_iampolicy

    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:GetObject",
      "Resource": "*"
    }
  ]
}
EOF
}