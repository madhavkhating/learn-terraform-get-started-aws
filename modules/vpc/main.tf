# Create a VPC
resource "aws_vpc" "learn_terraform_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.vpc_name
  }

}
# Create public subnets
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.learn_terraform_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}
#Create public subnet 2
resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.learn_terraform_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-2"
  }
}

#Create route table for public subnets
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.learn_terraform_vpc.id

  tags = {
    Name = "public-route-table"
  }
}
# Associate public subnet 1 with route table
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}
# Associate public subnet 2 with route table
resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}   
# Create Internet Gateway
resource "aws_internet_gateway" "learn_terraform_igw" {
  vpc_id = aws_vpc.learn_terraform_vpc.id

  tags = {
    Name = "learn-terraform-igw"
  }
}

# Associate route table with Internet Gateway
resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.learn_terraform_igw.id
} 
