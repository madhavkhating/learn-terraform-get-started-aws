output "web_server_public_ips" {
  description = "The public IP addresses of all web server instances"
  value       = aws_instance.web_server[*].public_ip
}

output "web_server_private_ips" {
  description = "The private IP addresses of all web server instances"
  value       = aws_instance.web_server[*].private_ip
}
