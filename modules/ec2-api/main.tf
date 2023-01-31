
# ec2 instance for api
resource "aws_instance" "fp_api" {
    ami = var.image
    instance_type = "t2.micro"
    key_name = var.api-key-pair
    vpc_security_group_ids = [ var.api-sg-id ]
    subnet_id = var.api-subnet-id
    associate_public_ip_address = true
    user_data_replace_on_change = true
    user_data = var.api-user-data
    tags = {
        Name ="fp_api"
    }
}