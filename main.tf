provider "aws" {
region = "us-west-2"
access_key = "your_access_key"
secret_key = "your_secret_key"                         
                
}


resource "aws_vpc" " VPC_Cloud " {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true             
  
}
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.VPC_Cloud.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"  # Change based on your region
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
  }
  resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.VPC.Cloud.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"  # Change based on your region
  map_public_ip_on_launch = true
  tags = {
    Name = "private-subnet"
  }
  }