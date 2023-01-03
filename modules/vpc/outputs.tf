# output variables for vpc module

output "vpc-id" {
    description = "vpc id output value"
    value = aws_vpc.fp_vpc.id
}
