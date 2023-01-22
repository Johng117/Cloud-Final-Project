
# create a public subnet within vpc for ec2_app

resource "aws_subnet" "fp_public_subnet_3" {
 
  vpc_id     = var.vpc-id
  cidr_block = var.cidr-pub-3
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  
  tags = {
    Name = "fp_public_3_subnet"
  }
}
