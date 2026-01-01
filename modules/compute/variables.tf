variable "vpc_id" { 
    description = "The ID of the VPC where resources will be created"
    type        = string
    default = "aws_vpc.learn_terraform_vpc.id"       
    }
 
 variable "web-server-sg" {
    description = "The name of the security group for web servers"
    type        = string
    default = "web-server-sg"       
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

variable "subnet_ids" {
  description = "A list of subnet IDs for different AZs"
  type        = list(string)
  default     = ["public-subnet", "public-subnet-2", "public-subnet-3"]
}
variable "availability_zones" {
  description = "A list of availability zones"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}