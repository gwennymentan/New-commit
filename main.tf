resource "aws_vpc" "myVpc" {
  cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "myPrivateSub1" {
  vpc_id     = aws_vpc.myVpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "myPrivateSubnet1"
  }
}
resource "aws_subnet" "myPrivateSub2" {
  vpc_id     = aws_vpc.myVpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "myPrivateSubnet2"
  }
}

resource "aws_subnet" "myPublicSubnet1" {
  vpc_id     = aws_vpc.myVpc.id
  cidr_block = "10.0.3.0/24"
availability_zone = "us-east-2"
  tags = {
    Name = "myPublicSubnet1"
  }
}
resource "aws_subnet" "myPublicSubnet2" {
  vpc_id     = aws_vpc.myVpc.id
  cidr_block = "10.0.4.0/24"
availability_zone = "us-east-2"
  tags = {
    Name = "myPublicSubnet2"
  }
}
resource "aws_instance" "test-instance" {
  ami           = "ami-0f19d220602031aed"
  instance_type = "t2.micro"

  tags = {
    Name = "instance1"
  }
}