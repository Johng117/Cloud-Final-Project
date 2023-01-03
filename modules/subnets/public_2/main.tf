
#create a public subnet for bastion within vpc
resource "aws_subnet" "fp_public_subnet_2" {
 
  vpc_id     = aws_vpc.fp_vpc.id
  cidr_block = var.PUB_SUB_2_CIDR
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  
  tags = {
    Name = "fp_public_2_subnet"
  }
}