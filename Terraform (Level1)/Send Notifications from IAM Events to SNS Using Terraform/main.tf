# ---------------------------
# SNS Topic
# ---------------------------
resource "aws_sns_topic" "xfusion_topic" {
  name = local.KKE_SNS_TOPIC_NAME
}

# ---------------------------
# IAM Role (Trusted by EC2)
# ---------------------------
resource "aws_iam_role" "xfusion_role" {
  name = local.KKE_ROLE_NAME

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# ---------------------------
# IAM Policy (Allow Publish)
# ---------------------------
resource "aws_iam_policy" "xfusion_policy" {
  name = local.KKE_POLICY_NAME

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "sns:Publish"
        Resource = aws_sns_topic.xfusion_topic.arn
      }
    ]
  })
}

# ---------------------------
# Attach Policy to Role
# ---------------------------
resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.xfusion_role.name
  policy_arn = aws_iam_policy.xfusion_policy.arn
}