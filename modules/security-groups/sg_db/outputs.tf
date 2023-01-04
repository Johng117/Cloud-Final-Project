# outputs for rds security group

output sg-rds-id {
    value = aws_security_group.rds_sg.id
}