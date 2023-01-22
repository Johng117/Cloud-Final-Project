# ec2 instance for app

resource "aws_instance" "fp_app" {
    ami = var.image
    instance_type = "t2.micro"
    key_name = var.key-pair
    vpc_security_group_ids = [var.sg-id]
    subnet_id = var.subnet-id
    associate_public_ip_address = true
    user_data_replace_on_change = true
    user_data = var.user-data
    tags = {
        Name ="fp_app"
    }
}