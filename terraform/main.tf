#provider

provider "aws" {
  region = "ap-south-1"
  access_key = "AKIASIU6FBLKAHDAW2ED"
  secret_key = "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"
}


#VPC

resource "aws_vpc" "ra-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "myvpc"
  }
}

#subnet

resource "aws_subnet" "subnet-1" {
  vpc_id            = aws_vpc.ra-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    name = "subnet-1"
  }
}


#Instance

resource "aws_instance" "myserver" {
  ami           = "ami-060f2cb962e997969"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet-1.id
  tags = {
    name = "myserver"
  }
}
