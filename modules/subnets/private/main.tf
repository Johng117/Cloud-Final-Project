

#create first private subnet within vpc
resource "aws_subnet" "fp_private_subnet_1" {
  vpc_id     = var.vpc-id
  cidr_block = var.cidr-pri-1
  availability_zone = "us-east-1b"

  tags = {
    Name = "fp_private_subnet_1"
  }
}

#create second private subnet within vpc
resource "aws_subnet" "fp_private_subnet_2" {
  vpc_id     = var.vpc-id
  cidr_block = var.cidr-pri-2
  availability_zone = "us-east-1a"

  tags = {
    Name = "fp_private_subnet_2"
  }
}

