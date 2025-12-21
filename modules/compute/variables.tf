variable "vpc_id" { 
    description = "The ID of the VPC where resources will be created"
    type        = string
    default = "aws_vpc.learn_terraform_vpc.id"       
    }
variable "subnet_id" { 
    description = "The ID of the Subnet where the first web server will be created" 
    type        = string
    default = "aws_subnet.private_subnet.id"       
    }
variable "subnet_id_2" {
    description = "The ID of the Subnet where the second web server will be created" 
    type        = string
    default = "aws_subnet.private_subnet_2.id"       
    }
    
variable "web-server-sg" {
    description = "The name of the security group for web servers"
    type        = string
    default = "web-server-sg"       
    }
variable "web-server-sg-2" {
    description = "The name of the security group for web servers"
    type        = string
    default = "web-server-sg-2"       
    }
variable "instance_type" {
    description = "The type of instance to use for the web servers"
    type        = string
    default = "t3.micro"       
    }
variable "ami" {
    description = "The AMI ID for the web server instances"
    type        = string
    default = "ami-01ca13db604661046"       
    }