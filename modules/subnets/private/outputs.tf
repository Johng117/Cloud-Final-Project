# output variables for private subnet module

output private-subnet-1-id {
    value = aws_subnet.fp_private_subnet_1.id
}

output private-subnet-2-id {
    value = aws_subnet.fp_private_subnet_2.id
}