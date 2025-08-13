output "public_bastion_host_ip" {
  description = "Public IP address of the public bastion host"
  value       = aws_instance.bastion.public_ip
}

output "private_bastion_host_private_ip" {
  description = "Private IP of the Private bastion host"
  value       = aws_instance.private_bastion.private_ip
}