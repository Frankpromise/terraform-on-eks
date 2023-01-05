# EC2 public IP with TOSET
output "Instance_public_ip" {
  description = "EC2 Instance for public ip"
  #value = aws_instance.myec2vm.*.public_ip #legacy splat
  #value = aws_instance.myec2vm[*].public_ip
  value = toset([for instance in aws_instance.myec2vm: instance.public_ip])
}


output "Instance_public_dns" {
  description = "EC2 Instance for public dns"
  #value = aws_instance.myec2vm.*.public_dns #legacy splat
  #value = aws_instance.myec2vm[*].public_dns
  value = toset([for instance in aws_instance.myec2vm: instance.public_dns])
}

output "Instance_public_dns2" {
  description = "EC2 Instance for public dns"
  #value = aws_instance.myec2vm.*.public_dns #legacy splat
  #value = aws_instance.myec2vm[*].public_dns
  value = toset({for dns, instance in aws_instance.myec2vm: dns => instance.public_dns})
}