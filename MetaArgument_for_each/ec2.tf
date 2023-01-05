# Availability Zone Datasource

data "aws_availability_zones" "my_zones" {
  filter {
    name = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

resource "aws_key_pair" "prom-auth" {
  key_name   = "mtckey"
  public_key = file("~/.ssh/mtckey.pub")
}


# EC2 instance

resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amzlinux2.id
  instance_type = var.Instance_type
  user_data = file("${path.module}/install.sh")
  key_name   = aws_key_pair.prom-auth.id
  vpc_security_group_ids = [aws_security_groups.vpc-ssh.id, aws_security_group.vpc-web.id]
  #creay ec2 instances in all availibility zones
  for_each = toset(data.aws_availability_zones.my_azones.key_name)
  availability_zone = each.key
  tags = {
    "Name" = "for_each-${each.value}"
  }

}