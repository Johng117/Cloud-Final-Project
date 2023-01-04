
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