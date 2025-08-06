terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}


provider "aws" {
  region = var.Aws_region

}

# VPC
resource "aws_vpc" "VPC_Cloud" {
  cidr_block         = var.cidr_block1
  enable_dns_support = true
}
# Public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.VPC_Cloud.id
  cidr_block              = var.cidr_block2
  availability_zone       = var.availability_zone1
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}
#  Private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.VPC_Cloud.id
  cidr_block              = var.cidr_block3        # "10.0.2.0/24"
  availability_zone       = var.availability_zone2 # Change based on your region
  map_public_ip_on_launch = true
  tags = {
    Name = "private-subnet"
  }
}
#  Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.VPC_Cloud.id

  tags = {
    Name = "main-igw"
  }
}

resource "aws_instance" "aws_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "IGW-Test_instance"
  }

}
resource "aws_security_group" "ec2_sg" {
  name        = "ec2_sg"
  description = "Allow SSH and HTTP access"
  vpc_id      = aws_vpc.VPC_Cloud.id  # reference your VPC

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # You can restrict this to your IP for better security
  }

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EC2 Security Group"
  }
}
resource "aws_route_table" "Route_Table" {
  vpc_id = aws_vpc.VPC_Cloud.id

route {
  cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}
}