resource "aws_eip" "example" {
domain = "vpc"
tags = {
  Name = var.KKE_eip
}
}