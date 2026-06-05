# Create Secrets Manager secret
resource "aws_secretsmanager_secret" "app_secret" {
  name = var.KKE_SECRET_NAME
}

resource "aws_secretsmanager_secret_version" "app_secret_value" {
  secret_id     = aws_secretsmanager_secret.app_secret.id
  secret_string = var.KKE_SECRET_VALUE
}

# IAM Role for EC2
resource "aws_iam_role" "app_role" {
  name = var.KKE_ROLE_NAME

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

# Inline IAM Policy
resource "aws_iam_role_policy" "app_policy" {
  name = var.KKE_POLICY_NAME
  role = aws_iam_role.app_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "secretsmanager:GetSecretValue"
        ]
        Resource = aws_secretsmanager_secret.app_secret.arn
      }
    ]
  })
}