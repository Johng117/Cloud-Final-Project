#create rds instance inside private subnet

resource "aws_db_instance" "fp_db" {
  identifier             = "final-project"
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "14.1"
  username               = "fp"
  password               = var.RDS_PASSWORD
  db_subnet_group_name   = aws_db_subnet_group.fp_rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  parameter_group_name   = aws_db_parameter_group.rds_pg.name
  skip_final_snapshot    = true
}

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
        security_groups = [aws_security_group.fp_bastion_sg.id]
        # cidr_blocks = ["0.0.0.0/0"]
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