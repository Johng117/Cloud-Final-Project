# create a vpc for project 
resource "aws_vpc" "fp_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "fp_vpc"
  }
}

# create a private subnet within vpc
# resource "aws_subnet" "fp_private_subnet" {
#   vpc_id     = aws_vpc.fp_vpc.id
#   cidr_block = "10.0.0.0/16"

#   tags = {
#     Name = "fp_private_subnet"
#   }
# }

#create a public subnet within vpc
resource "aws_subnet" "fp_public_subnet" {
  vpc_id     = aws_vpc.fp_vpc.id
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "fp_public_subnet"
  }
}

resource "aws_internet_gateway" "fp_ig" {
    vpc_id = aws_vpc.fp_vpc.id
    tags = {
        Name = "fp_ig"
    }
}

resource "aws_route" "fp_ig_route" {
  route_table_id         = aws_vpc.fp_vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.fp_ig.id
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