
output "instance_1_ip" {
  description = "Public IP address of the first EC2 instance"
  value       = aws_instance.app_servers[0].public_ip
}

output "instance_2_ip" {
  description = "Public IP address of the second EC2 instance"
  value       = aws_instance.app_servers[1].public_ip
}

output "instance_3_ip" {
  description = "Public IP address of the third EC2 instance"
  value       = aws_instance.app_servers[2].public_ip
}
