# Provision nautilus-ec2 instance
resource "aws_instance" "instance" {
  ami = "ami-005e54dee72cc1d00"
  instance_type = "t2.micro"

  tags = {
    Name = "nautilus-ec2"
  }
}

# Allocation nautilus-eip 
resource "aws_eip" "eip" {
  domain = "vpc"

  tags = {
    Name = "nautilus-eip"
  }
}

# association nautilus-eip with nautilus-ec2 instance
resource "aws_eip_association" "eip_association" {
  instance_id = aws_instance.instance.id
  allocation_id = aws_eip.eip.id
}

