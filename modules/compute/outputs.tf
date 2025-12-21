output "web_server_ip" {
  description = "The public IP address of the first web server"
  value       = aws_instance.web_server.public_ip
}
output "web_server_2_ip" {
  description = "The public IP address of the second web server"
  value       = aws_instance.web_server_2.public_ip
}