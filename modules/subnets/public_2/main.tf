
#vcreate a public subnet within vpc for ec2_api
resource "aws_subnet" "fp_public_subnet_2" {
 
  vpc_id     = var.vpc_id
  cidr_block = var.PUB_SUB_2_CIDR
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  
  tags = {
    Name = "fp_public_2_subnet"
  }
}
