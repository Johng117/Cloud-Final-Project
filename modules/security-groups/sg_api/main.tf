# security group for final project api
resource "aws_security_group" "fp_api_sg" {
    name = "fp_api_sg"
    description = "security group for api"
    vpc_id = var.vpc-id
   
    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.my-ip]
    }

    ingress {
        description = "3001"
        from_port = 3001
        to_port = 3001
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    # ingress {
    #     description = "fp-app-sg"
    #     from_port = 0
    #     to_port = 65535
    #     protocol = "tcp"
    #     security_groups = [aws_security_group.fp_app_sg.id]
    # }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }
    tags = {
        Name = "fp_api_sg"
    }
}