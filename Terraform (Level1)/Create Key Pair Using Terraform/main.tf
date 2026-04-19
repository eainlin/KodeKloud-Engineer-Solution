resource "tls_private_key" "datacenter-kp" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "datacenter-kp" {
  key_name   = "datacenter-kp"
  public_key = tls_private_key.datacenter-kp.public_key_openssh

}

resource "local_file" "private_key" {
  content              = tls_private_key.datacenter-kp.private_key_pem
  filename             = "/home/bob/datacenter-kp.pem"
  file_permission      = "0600"
  directory_permission = "0700"
}