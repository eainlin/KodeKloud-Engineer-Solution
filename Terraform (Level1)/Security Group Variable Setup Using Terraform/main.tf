resource "aws_security_group" "example" {
  name = var.KKE_sg
  description = "security group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
  
  tags = {
    Name = var.KKE_sg        
  }
}