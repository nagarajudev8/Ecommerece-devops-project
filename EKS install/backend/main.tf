provider "aws"{
    region = "eu-west-1"
}

resource "aws_s3_bucket" "terraform_backend" {
    bucket = "my-terraform-backend-bucket-nagaraju"

    lifecycle {
        prevent_destroy = false
    }
}

resource "aws_s3_bucket_versioning" "terraform_backend" {

    bucket=aws_s3_bucket.terraform_backend.id
    versioning_configuration {
      status = "Enabled"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_backend" {
    bucket = aws_s3_bucket.terraform_backend.id
    rule {
        apply_server_side_encryption_by_default{
            sse_algorithm = "AES256"
        }
      
    }
}

resource "aws_dynamodb_table" "terraform_lock" {
    name = "terraform_lock_table_nagaraju"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
  
}