# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  subnet_id     = "subnet-1b3f662e7b430cefa"
  vpc_security_group_ids = [
    "sg-2cc93b98f034d9b0f"
  ]

  tags = {
    Name = "datacenter-ec2-t1q3"
  }
}

# Provision Elastic IP
resource "aws_eip" "ec2_eip" {
  tags = {
    Name = "datacenter-ec2-eip-t1q3"
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2.id
  allocation_id = aws_eip.ec2_eip.id
}