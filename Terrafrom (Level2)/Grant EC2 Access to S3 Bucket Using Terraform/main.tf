# S3 Bucket
resource "aws_s3_bucket" "logs_bucket" {
  bucket = var.KKE_BUCKET_NAME
}

# IAM Policy Document
data "aws_iam_policy_document" "s3_put_policy" {
  statement {
    effect = "Allow"

    actions = [
      "s3:PutObject"
    ]

    resources = [
      "${aws_s3_bucket.logs_bucket.arn}/*"
    ]
  }
}

# IAM Policy
resource "aws_iam_policy" "datacenter_policy" {
  name   = var.KKE_POLICY_NAME
  policy = data.aws_iam_policy_document.s3_put_policy.json
}

# IAM Role
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

# Attach Policy to Role
resource "aws_iam_role_policy_attachment" "policy_attach" {
  role       = aws_iam_role.datacenter_role.name
  policy_arn = aws_iam_policy.datacenter_policy.arn
}

# Instance Profile
resource "aws_iam_instance_profile" "instance_profile" {
  name = "datacenter-instance-profile"
  role = aws_iam_role.datacenter_role.name
}

# Security Group
resource "aws_security_group" "ec2_sg" {
  name = "datacenter-ec2-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "datacenter_ec2" {
  ami                    = data.aws_ami.amazon_linux2.id
  instance_type          = "t2.micro"
  iam_instance_profile   = aws_iam_instance_profile.instance_profile.name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "datacenter-ec2"
  }
}