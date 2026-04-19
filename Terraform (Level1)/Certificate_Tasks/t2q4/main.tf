resource "aws_iam_policy" "new_policy" {
  name        = var.KKE_iampolicy
  description = "IAM policy for Kodekloud Engineer Task 2 Question 4"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ec2:DescribeInstances",
          "ec2:StartInstances",
          "ec2:StopInstances"
        ],
        Resource = "*"
      }
    ]
  })
  
}