variable "aws_region" {
  description = "Region in which aws resource is to be created"
  type = string
  default = "us-west-1"
}

# AWS EC2 Instance type

variable "Instance_type" {
  type = string
  default = "t2.micro"
}

