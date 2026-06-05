output "KKE_vpc_name" {
  value = aws_vpc.main_vpc.tags["Name"]
}

output "KKE_subnet_name" {
  value = aws_subnet.main_subnet.tags["Name"]
}

output "KKE_ec2_private" {
  value = aws_instance.main_ec2.tags["Name"]
}