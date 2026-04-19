resource "aws_vpc" "datacenter_vpc" {
  cidr_block = "10.0.0.0/16"   # you can choose any valid IPv4 CIDR

  tags = {
    Name = "datacenter-vpc-t5q1"
  }
}