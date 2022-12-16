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