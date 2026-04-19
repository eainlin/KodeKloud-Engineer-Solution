resource "aws_iam_role" "new_role" {
    name = var.KKE_iamrole

    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ]
}
EOF
tags = {
    Name = var.KKE_iamrole
  }
}