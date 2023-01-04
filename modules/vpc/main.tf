# create a vpc for project 
resource "aws_vpc" "fp_vpc" {
  cidr_block       = var.vpc-cidr
  instance_tenancy = "default"

  tags = {
    Name = "fp_vpc"
  }
}

#created an internet gateway for the vpc
resource "aws_internet_gateway" "fp_ig" {
    vpc_id = aws_vpc.fp_vpc.id
    tags = {
        Name = "fp_ig"
    }
}

# a route to the internet gateway from the route table
resource "aws_route" "fp_ig_route" {
  route_table_id         = aws_vpc.fp_vpc.default_route_table_id
  destination_cidr_block = var.fp-ig-route-cidr
  gateway_id             = aws_internet_gateway.fp_ig.id
}


# route table for private subnet with no rules set
resource "aws_route_table" "fp_private_subnet_rt" {
  vpc_id = aws_vpc.fp_vpc.id

  tags =  {
    Name = "private-route-table"
  }
}

# route table association for private subnet 1
resource "aws_route_table_association" "private_rt_association_1" {
  subnet_id      = var.private-subnet-1-id
  #aws_subnet.fp_private_subnet_1.id
  route_table_id = aws_route_table.fp_private_subnet_rt.id
}

# route table association for private subnet 2
resource "aws_route_table_association" "private_rt_association_2" {
  subnet_id      = var.private-subnet-2-id
  #aws_subnet.fp_private_subnet_2.id
  route_table_id = aws_route_table.fp_private_subnet_rt.id
}



