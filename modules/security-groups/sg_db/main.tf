# security group for rds instance

resource "aws_security_group" "rds_sg" {
    name = "rds_sg"
    description = "security group for rds instance"
    vpc_id = aws_vpc.fp_vpc.id
    ingress {
        description = "postgres_port"
        from_port = 5432
        to_port = 5432
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "bastion_sg"
        from_port = 5432
        to_port = 5432
        protocol = "tcp"
        security_groups = [aws_security_group.fp_bastion_sg.id]
    }
    
    ingress {
        description = "fp_api_sg"
        from_port = 5432
        to_port = 5432
        protocol = "tcp"
        security_groups = [aws_security_group.fp_api_sg.id]
    }

    
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }
    tags = {
        Name = "rds_sg"
    }
}