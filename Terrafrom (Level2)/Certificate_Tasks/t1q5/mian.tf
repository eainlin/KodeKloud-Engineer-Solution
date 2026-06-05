# Existing EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"

  vpc_security_group_ids = [
    "sg-8a581a76be3899d78"
  ]

  tags = {
    Name = "xfusion-ec2-t1q5"
  }
}

# Create AMI from existing instance
resource "aws_ami_from_instance" "ami" {
  name               = "xfusion-ec2-ami-t1q5"
  source_instance_id = aws_instance.ec2.id

  tags = {
    Name = "xfusion-ec2-ami-t1q5"
  }
}

# Launch new EC2 instance from the AMI
resource "aws_instance" "new_ec2" {
  ami           = aws_ami_from_instance.ami.id
  instance_type = "t2.micro"

  vpc_security_group_ids = [
    "sg-8a581a76be3899d78"
  ]

  tags = {
    Name = "xfusion-ec2-new-t1q5"
  }
}