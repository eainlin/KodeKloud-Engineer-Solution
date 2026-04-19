resource "aws_vpc" "xfusion-vpc" {
  cidr_block       = "192.168.0.0/24"
  instance_tenancy = "default"

  tags = {
    Name = "xfusion-vpc"
  }
}