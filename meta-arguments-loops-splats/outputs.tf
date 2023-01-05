# output- for loop with list

output "for_output_list" {
  description = "For loop with list"
  value = [for instance in aws_instance.myec2vm: instance.public_dns]
}

# Output- for loop with map

output "for-loop-with-map1" {
  description = "For loop with Map1"
  value = { for instance in aws_instance.myec2vm: instance.id => instance.public_dns}
}

# Output- for loop with Map advanced 
output "for_output_map2" {
 descdescription = "For loop with Map advanced" 
 value = {for c, instance in aws_instance.myec2vm: c => instance.public_dns}
}

# using splat operators

output "output-for-splat" {
  description = "Legacy splat operator"
  value = aws_instance.myec2vm.*.public_dns
}

#another method to use he splat operator
output "new_splat_operator" {
  description = "latest splat operator"
  value = aws_instance.myec2vm[*].public_dns
}