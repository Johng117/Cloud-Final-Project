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

# ec2 instance for bastion host
resource "aws_instance" "fp_bastion" {
    ami = var.IMAGE
    instance_type = "t2.micro"
    key_name = var.KEY_PAIR
    vpc_security_group_ids = [aws_security_group.fp_bastion_sg.id]
    subnet_id = aws_subnet.fp_public_subnet.id
    associate_public_ip_address = true
    user_data = "${file("psql_install.sh")}"
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
        cidr_blocks = [var.MY_IP]
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

# ec2 instance for api
resource "aws_instance" "fp_api" {
    ami = var.IMAGE
    instance_type = "t2.micro"
    key_name = var.API_KEY_PAIR
    vpc_security_group_ids = [aws_security_group.fp_api_sg.id]
    subnet_id = aws_subnet.fp_public_subnet_2.id
    associate_public_ip_address = true
    user_data = "${file("fp_api.sh")}"
    tags = {
        Name ="fp_api"
    }
}


# security group for final project api
resource "aws_security_group" "fp_api_sg" {
    name = "fp_api_sg"
    description = "security group for api"
    vpc_id = aws_vpc.fp_vpc.id
   
    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.MY_IP]
    }

    ingress {
        description = "3001"
        from_port = 3001
        to_port = 3001
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "fp-app-sg"
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        security_groups = [aws_security_group.fp_app_sg.id]
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

# security group for final project api
resource "aws_security_group" "fp_app_sg" {
    name = "fp_app_sg"
    description = "security group for app"
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
        cidr_blocks = [var.MY_IP]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }
    tags = {
        Name = "fp_app_sg"
    }
}







# parameter group for rds database instance
resource "aws_db_parameter_group" "rds_pg" {
  name   = "fp-parameter-group"
  family = "postgres14"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}
# subnet group for rds database instance
resource "aws_db_subnet_group" "fp_rds_subnet_group" {
  name        = "fp-rds-subnet-group"
  description = "Final project RDS subnet group"
  subnet_ids  = [aws_subnet.fp_private_subnet_1.id, aws_subnet.fp_private_subnet_2.id]
}



