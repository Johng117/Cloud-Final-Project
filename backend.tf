# s3 bucket provisioning 
terraform {
    backend "s3" {
        bucket = "fp-bucket-13244321"
        key = "s3/terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "fp-lock"
        encrypt = true
    }
}