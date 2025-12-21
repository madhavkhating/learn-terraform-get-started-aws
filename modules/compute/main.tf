
#Create EC2 instance

resource "aws_instance" "web_server" {
  ami           = var.ami #Red Hat Enterprise Linux version 10 (HVM), EBS General Purpose (SSD) Volume Type
  instance_type = var.instance_type
  
  tags = {Name = "web-server"}
  availability_zone = "ap-south-1a"
  security_groups = [aws_security_group.web_server_sg.id] 
  subnet_id = var.subnet_id
}
resource "aws_instance" "web_server_2" {
  ami           = "ami-01ca13db604661046" #Red Hat Enterprise Linux version 10 (HVM), EBS General Purpose (SSD) Volume Type
  instance_type = var.instance_type

  tags = {Name = "web-server_2"}
  availability_zone = "ap-south-1b"
  security_groups = [aws_security_group.web_server_sg_2.id] 
  subnet_id = var.subnet_id_2
}
resource "aws_security_group" "web_server_sg" {
  name        = var.web-server-sg
  description = "Allow HTTP and SSH traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]     

    }
    ingress {   
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = var.web-server-sg
        }
}
resource "aws_security_group" "web_server_sg_2" {
  name        = var.web-server-sg-2
  description = "Allow HTTP and SSH traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]     

    }
    ingress {   
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = var.web-server-sg-2
        }
}