# terraform {
#     backend "s3" {
#         bucket = "fp-bucket"
#         key = "s3/terraform.tfstate"
#         # region = "us-east-1"
#         dynamodb_table = "fp-a1b2c3d4e5f6-lock"
#         encrypt = true
#     }
# }