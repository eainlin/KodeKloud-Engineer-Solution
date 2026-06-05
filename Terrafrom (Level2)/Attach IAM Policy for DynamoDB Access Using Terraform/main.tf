# ---------------------------
# DynamoDB Table
# ---------------------------
resource "aws_dynamodb_table" "datacenter_table" {
  name         = var.KKE_TABLE_NAME
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

# ---------------------------
# IAM Role
# ---------------------------
resource "aws_iam_role" "datacenter_role" {
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

# ---------------------------
# IAM Policy (Read Only)
# ---------------------------
resource "aws_iam_policy" "readonly_policy" {
  name = var.KKE_POLICY_NAME

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "dynamodb:GetItem",
          "dynamodb:Scan",
          "dynamodb:Query"
        ]
        Resource = aws_dynamodb_table.datacenter_table.arn
      }
    ]
  })
}

# ---------------------------
# Attach Policy to Role
# ---------------------------
resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.datacenter_role.name
  policy_arn = aws_iam_policy.readonly_policy.arn
}