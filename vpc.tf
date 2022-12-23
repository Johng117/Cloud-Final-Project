# create a vpc for project 
resource "aws_vpc" "fp_vpc" {
  cidr_block       = var.VPC_CIDR
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
  destination_cidr_block = var.FP_IG_ROUTE_CIDR
  gateway_id             = aws_internet_gateway.fp_ig.id
}



#create a private subnet within vpc
resource "aws_subnet" "fp_private_subnet" {
  vpc_id     = aws_vpc.fp_vpc.id
  cidr_block = var.PRI_SUB_CIDR
  availability_zone = "us-east-1a"

  tags = {
    Name = "fp_private_subnet"
  }
}

# route table for private subnet with no rules set
resource "aws_route_table" "fp_private_subnet_rt" {
  vpc_id = aws_vpc.fp_vpc.id

  tags =  {
    Name = "private-route-table"
  }
}

#route table association for private subnet
resource "aws_route_table_association" "private_rt_association" {
  subnet_id      = aws_subnet.fp_private_subnet.id
  route_table_id = aws_route_table.fp_private_subnet_rt.id
}

#create a public subnet within vpc
resource "aws_subnet" "fp_public_subnet" {
  vpc_id     = aws_vpc.fp_vpc.id
  cidr_block = var.PUB_SUB_CIDR
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "fp_public_subnet"
  }
}


# resource "aws_route_table" "fp_rt" {
#   vpc_id = aws_vpc.fp_vpc.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.fp_ig.id
#   }
#   tags = {
#     Name = "fp_rt"
#   }
# }

# resource "aws_route_table_association" "fp_rt" {
#   subnet_id      = aws_subnet.fp_public_subnet.id
#   route_table_id = aws_route_table.fp_rt.id
# }