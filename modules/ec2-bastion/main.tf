# ec2 instance for bastion host
resource "aws_instance" "fp_bastion" {
    ami = var.IMAGE
    instance_type = "t2.micro"
    key_name = var.BASTION_KP
    vpc_security_group_ids = [aws_security_group.fp_bastion_sg.id]
    subnet_id = aws_subnet.fp_public_subnet.id
    associate_public_ip_address = true
    user_data = "${file("psql_install.sh")}"
    tags = {
        Name ="fp_bastion"
    }
}

