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

# AWS EC2 Instance type -> list

variable "Instance_type_list" {
  type = list
  default = ["t2.micro", "t2.small", "t3.large"]
}

# AWS EC2 Instance type -> map
variable "Instance_type_map" {
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "qa" = "t2.small"
    "prod" = "t3.large"
  }
}