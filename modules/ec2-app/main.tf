# ec2 instance for app

resource "aws_instance" "fp_app" {
    ami = var.IMAGE
    instance_type = "t2.micro"
    key_name = var.APP_KEY_PAIR
    vpc_security_group_ids = [aws_security_group.fp_app_sg.id]
    subnet_id = aws_subnet.fp_public_subnet_2.id
    associate_public_ip_address = true
    # user_data = "${file("fp_api.sh")}"
    tags = {
        Name ="fp_app"
    }
}