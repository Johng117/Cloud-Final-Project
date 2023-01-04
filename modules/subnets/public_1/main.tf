#create a public subnet for bastion within vpc
resource "aws_subnet" "fp_public_subnet" {
 
  vpc_id     = var.vpc-id
  cidr_block = var.PUB_SUB_CIDR
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  
  tags = {
    Name = "fp_public_subnet"
  }
}
