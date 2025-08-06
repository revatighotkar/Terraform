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