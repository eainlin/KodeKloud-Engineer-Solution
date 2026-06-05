resource "aws_vpc" "main_vpc" {
    cidr_block = var.KKE_VPC_CIDR
    tags = {
        Name = "xfusion-priv-vpc-t2q3"
    }
}

resource "aws_subnet" "main_subnet" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = var.KKE_SUBNET_CIDR
    map_public_ip_on_launch = false
    tags = {
        Name = "xfusion-priv-subnet-t2q3"
    }
}

resource "aws_instance" "private_ec2" {
    ami = "ami-0c101f26f147fa7fd"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.main_subnet.id
    tags = {
        Name = "xfusion-priv-ec2-t2q3"
    }
}


