resource "aws_s3_bucket" "my_state_bucket" {
  bucket = "talent-academy-837668009166-tfstates-alex"


  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "talent-academy-tfstates"
    Environment = "Test"
  }
}

resource "aws_s3_bucket_versioning" "my_state_bucket" {
  bucket = aws_s3_bucket.my_state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_lock_tbl" {
  name           = "terraform-lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags           = {
    Name = "terraform-lock"
  }
}