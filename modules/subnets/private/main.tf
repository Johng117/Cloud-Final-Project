

#create first private subnet within vpc
resource "aws_subnet" "fp_private_subnet_1" {
  vpc_id     = aws_vpc.fp_vpc.id
  cidr_block = var.PRI_SUB_CIDR_1
  availability_zone = "us-east-1b"

  tags = {
    Name = "fp_private_subnet_1"
  }
}

#create second private subnet within vpc
resource "aws_subnet" "fp_private_subnet_2" {
  vpc_id     = aws_vpc.fp_vpc.id
  cidr_block = var.PRI_SUB_CIDR_2
  availability_zone = "us-east-1a"

  tags = {
    Name = "fp_private_subnet_2"
  }
}

