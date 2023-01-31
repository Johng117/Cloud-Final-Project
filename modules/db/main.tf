
# subnet group for rds database instance
resource "aws_db_subnet_group" "fp_rds_subnet_group" {
  name        = "fp-rds-subnet-group"
  description = "Final project RDS subnet group"
  subnet_ids  = [ var.private-1, var.private-2 ]
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

#create rds instance inside private subnet
resource "aws_db_instance" "fp_db" {
  identifier             = "final-project"
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "14.3"
  username               = var.user
  password               = var.rds-password
  db_subnet_group_name   = aws_db_subnet_group.fp_rds_subnet_group.name
  vpc_security_group_ids = [var.rds-sg]
  parameter_group_name   = aws_db_parameter_group.rds_pg.name
  skip_final_snapshot    = true
}


