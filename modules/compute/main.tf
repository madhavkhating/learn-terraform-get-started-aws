
#Create EC2 instance

resource "aws_instance" "web_server" {
  ami           = var.ami #Red Hat Enterprise Linux version 10 (HVM), EBS General Purpose (SSD) Volume Type
  instance_type = var.instance_type
  count = 3
  tags = {Name = count.index  == 0 ? "Web-Server-1" : count.index == 1 ? "Web-Server-2" : "Web-Server-3"}
  availability_zone = var.availability_zones[count.index]
  subnet_id = var.subnet_ids[count.index]
  security_groups = [aws_security_group.web_server_sg.id] 
  key_name = aws_key_pair.learn-aws.key_name
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
    ingress {
      from_port   = 0
      to_port     = 0
      protocol    = "8"
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

resource "aws_key_pair" "learn-aws" {
  key_name   = "learn-aws-key"
  public_key = file("C:/Users/mkhat/Downloads/learn-aws-pub")
}
 