output "ec2_instance_id" {
  value = aws_instance.ec2.id
}

output "ami_id" {
  value = aws_ami_from_instance.datacenter-ec2-ami.id
}
