output "learn_terraform_vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.learn_terraform_vpc.id
  
}
output "public_subnet_id" {
  description = "The ID of the first public subnet"
  value       = aws_subnet.public_subnet.id
}
output "public_subnet_2_id" {
  description = "The ID of the second public subnet"
  value       = aws_subnet.public_subnet_2.id
}
