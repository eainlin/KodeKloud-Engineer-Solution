
# Generate a new RSA private key
resource "tls_private_key" "devops_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create AWS Key Pair using the generated key
resource "aws_key_pair" "devops_kp" {
  key_name   = "devops-kp"
  public_key = tls_private_key.devops_key.public_key_openssh
}

# Create EC2 instance
resource "aws_instance" "devops_ec2" {
  ami           = var.ami
  instance_type = var.ec2-instance-type
  key_name      = aws_key_pair.devops_kp.key_name

  # Default security group is attached automatically
  tags = {
    Name = var.ec2-instance-name
  }
}
