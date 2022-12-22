terraform {
    required_providers {
        aws = {
            source: "hashicorp/aws",
            version: "~> 4.16"
        }
    }
    required_version = ">= 1.2.0"
}

provider "aws" {
    region = var.AWS_REGION
}

resource "aws_instance" "fp_bastion" {
    ami = var.IMAGE
    instance_type = "t2.micro"
    key_name = var.KEY_PAIR
    vpc_security_group_ids = [aws_security_group.fp_bastion_sg.id]
    subnet_id = aws_subnet.fp_public_subnet.id
    associate_public_ip_address = true

    tags = {
        Name ="fp_bastion"
    }
}

resource "aws_security_group" "fp_bastion_sg" {
    name = "fp_bastion_sg"
    description = "security group for bastion host"
    vpc_id = aws_vpc.fp_vpc.id
    ingress {
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "HTTPS"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["86.149.44.13/32"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }
    tags = {
        Name = "fp_bastion_sg"
    }
}


# resource "aws_db_instance" "fp_db" {
#   identifier             = "final project"
#   instance_class         = "db.t3.micro"
#   allocated_storage      = 5
#   engine                 = "postgres"
#   engine_version         = "14.1"
#   username               = "fp"
#   password               = var.db_password
#   db_subnet_group_name   = aws_db_subnet_group.education.name
#   vpc_security_group_ids = [aws_security_group.rds.id]
#   parameter_group_name   = aws_db_parameter_group.education.name
#   publicly_accessible    = true
#   skip_final_snapshot    = true
# }

