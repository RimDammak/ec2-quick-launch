output "instance_id" {
  value = aws_instance.windows_vm.id
}

output "public_ip" {
  value = aws_instance.windows_vm.public_ip
}

output "rdp_security_group_id" {
  value = aws_security_group.rdp.id
}
