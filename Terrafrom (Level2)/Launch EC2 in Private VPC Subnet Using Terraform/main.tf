# VPC
resource "aws_vpc" "datacenter_vpc" {
  cidr_block = var.KKE_VPC_CIDR

  tags = {
    Name = "datacenter-priv-vpc"
  }
}

# Subnet (NO auto-assign public IP)
resource "aws_subnet" "datacenter_subnet" {
  vpc_id                  = aws_vpc.datacenter_vpc.id
  cidr_block              = var.KKE_SUBNET_CIDR
  map_public_ip_on_launch = false

  tags = {
    Name = "datacenter-priv-subnet"
  }
}

# Security Group (allow only VPC CIDR)
resource "aws_security_group" "datacenter_sg" {
  name   = "datacenter-priv-sg"
  vpc_id = aws_vpc.datacenter_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.KKE_VPC_CIDR]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "datacenter-priv-sg"
  }
}

# EC2 Instance
resource "aws_instance" "datacenter_ec2" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 (us-east-1)
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.datacenter_subnet.id

  vpc_security_group_ids = [aws_security_group.datacenter_sg.id]

  tags = {
    Name = "datacenter-priv-ec2"
  }
}