# ec2 instance for bastion host
resource "aws_instance" "fp_bastion" {
    ami = var.image
    instance_type = "t2.micro"
    key_name = var.bastion-key-pair
    vpc_security_group_ids = [ var.bastion-sg-id ]
    subnet_id = var.bastion-subnet-id
    associate_public_ip_address = false
    user_data = var.bastion-user-data
    tags = {
        Name ="fp_bastion"
    }
}

