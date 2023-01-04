
# ec2 instance for api
resource "aws_instance" "fp_api" {
    ami = var.IMAGE
    instance_type = "t2.micro"
    key_name = var.API_KEY_PAIR
    vpc_security_group_ids = [aws_security_group.fp_api_sg.id]
    subnet_id = aws_subnet.fp_public_subnet_2.id
    associate_public_ip_address = true
    user_data = var.user-data
    tags = {
        Name ="fp_api"
    }
}