# module to create s3 bucket

resource "aws_s3_bucket" fp_s3_bucket {
    bucket = var.bucket-name
    lifecycle {
        prevent_destroy = true
    }
    versioning  {
        enabled = true
    }

    server_side_encryption_configuration {
      rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
        }
      }
    }
    tags = {
        Name = "fp bucket"
  }
} 

resource "aws_s3_bucket_acl" fp_s3_bucket_acl {
  bucket = aws_s3_bucket.fp_s3_bucket.id
  acl    = var.acl-value
  region = var.region
  access_key = var.access-key
  secret_key = var.secret-key
}


resource "aws_dynamodb_table" fp_locks {
    name = var.dynamo-name
    hash_key = var.dynamo-hash
    billing_mode = "PAY_PER_REQUEST"
    attribute {
        name = var.dynamo-hash
        type = var.dynamo-hash-type
    }
}