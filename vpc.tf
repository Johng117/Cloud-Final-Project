# create a vpc for project 
resource "aws_vpc" "fp_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "fp_vpc"
  }
}

# create a private subnet within vpc
resource "aws_subnet" "fp_private_subnet" {
  vpc_id     = aws_vpc.fp_vpc.id
  cidr_block = "10.0.0.0/16"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "fp_private_subnet"
  }
}