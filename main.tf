provider "aws" {
region = "us-west-1"
access_key = "your_access_key"
secret_key = "your_secret_key"                         
                
}

# VPC
resource "aws_vpc" " VPC_Cloud " {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true             
}
# Public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.VPC_Cloud.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-west-1a"  # Change based on your region
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
  }
#  Private subnet
  resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.VPC.Cloud.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-west-1b"  # Change based on your region
  map_public_ip_on_launch = true
  tags = {
    Name = "private-subnet"
  }
  }
#  Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.VPC.Cloud.id

  tags = {
    Name = "main-igw"
  }
}