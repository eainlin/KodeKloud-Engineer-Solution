variable "ec2-instance-name" {
  type = string
  description = "for display name of ec2"
  default = "devops-ec2"
}

variable "ami" {
  type = string
  description = "for amazon machine images"
  default = "ami-0c101f26f147fa7fd"
}

variable "ec2-instance-type" {
  type = string
  description = "for ec2-instance-type"
  default = "t2.micro"
}
