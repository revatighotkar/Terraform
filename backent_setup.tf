resource "aws_s3_bucket" "terraform_state1_terraform" {
  bucket = var.backend_bucket


}

resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state1_terraform.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.terraform_state1_terraform.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
resource "aws_dynamodb_table" "terraform_lock" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Terraform Lock Table"
    Environment = "Dev"
  }
}
