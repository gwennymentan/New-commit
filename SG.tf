# Security Group for the Bastion Host aka Jump Box
resource "aws_security_group" "ssh-mySG" {
  name        = "SSH mySG"
  description = "Allow SSH Access on Port 22"
  vpc_id      = aws_vpc.myVpc.id

  ingress {
    description      = "SSH Access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SSH mySG"
  }
}
resource "aws_security_group" "mySG2" {
  name        = "mySG2"
  description = "Allow HTTP/HTTPS inbound traffic on Port 80/443"
  vpc_id      = aws_vpc.myVpc.id

  ingress {
    description      = "HTTP Access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTPS Access"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mySG"
  }
}
