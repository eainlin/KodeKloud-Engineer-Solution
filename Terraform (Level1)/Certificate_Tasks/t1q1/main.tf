# Generate RSA private key
resource "tls_private_key" "nautilus_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create AWS key pair
resource "aws_key_pair" "nautilus_kp" {
  key_name   = "nautilus-kp-t1q1"
  public_key = tls_private_key.nautilus_key.public_key_openssh
}

# Save private key to /home/bob
resource "local_file" "private_key" {
  content         = tls_private_key.nautilus_key.private_key_pem
  filename        = "/home/bob/nautilus-kp-t1q1.pem"
  file_permission = "0400"
}