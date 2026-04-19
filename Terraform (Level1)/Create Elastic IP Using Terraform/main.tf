resource "aws_eip" "nautilus-eip" {
  domain = "vpc"

  tags = {
    name = "nautilus-eip"
  }
}