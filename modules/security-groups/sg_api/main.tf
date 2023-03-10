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
        description = "http"
        from_port = 3001
        to_port = 3001
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

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