output "learn_terraform_vpc_id" {
	description = "The ID of the VPC created by the module"
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
output "public_subnet_3_id" {
	description = "The ID of the third public subnet"
	value       = aws_subnet.public_subnet_3.id
}
output "public_subnet_ids" {
	description = "The IDs of all public subnets"
	value       = [aws_subnet.public_subnet.id, aws_subnet.public_subnet_2.id, aws_subnet.public_subnet_3.id]
}