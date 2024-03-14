provider "aws" {
  region = "ap-south-1" 
}

resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"  
}

resource "aws_subnet" "default" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = "10.0.1.0/24"  
  availability_zone = "ap-south-1a"  
}

resource "aws_instance" "example" {
  ami           = "ami-0c1a7f89451184c8b"  
  instance_type = "t2.micro"                
  subnet_id     = aws_subnet.default.id

  tags = {
    Name = "My_EC2_instance"
  }
}
