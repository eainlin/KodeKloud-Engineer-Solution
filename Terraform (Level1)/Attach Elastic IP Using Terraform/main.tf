# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0a2b4fc66896af9d7"
  vpc_security_group_ids = [
    "sg-ed52df3c074332674"
  ]

  tags = {
    Name = "datacenter-ec2"
  }
}

# Provision Elastic IP
resource "aws_eip" "ec2_eip" {
  instance = aws_instance.ec2.id
  tags = {
    Name = "datacenter-ec2-eip"
  }
}