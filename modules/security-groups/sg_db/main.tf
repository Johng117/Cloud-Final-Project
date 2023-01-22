# security group for rds instance

resource "aws_security_group" "rds_sg" {
    name = "rds_sg"
    description = "security group for rds instance"
    vpc_id = var.vpc-id

    ingress {
        description = "bastion_sg"
        from_port = 5432
        to_port = 5432
        protocol = "tcp"
        security_groups = [var.bastion]
        
    }
    
    ingress {
        description = "fp_api_sg"
        from_port = 5432
        to_port = 5432
        protocol = "tcp"
        security_groups = [var.api]
    
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