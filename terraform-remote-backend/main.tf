provider "aws" {
  region = var.aws_region
}
data "aws_caller_identity" "current" {}

# S3 Bucket for Terraform state files
resource "aws_s3_bucket" "project_infinte" {
  bucket = var.aws_s3_bucket
  tags = {
    Name        = "project-infinte-terraform-state"
    Environment = var.env[0]
  }
}
resource "aws_s3_bucket_ownership_controls" "owner" {
  bucket = aws_s3_bucket.project_infinte.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}
resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.project_infinte.id
  versioning_configuration {
    status = "Enabled"
  }
}
# Block public access to the S3 bucket
resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.project_infinte.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
# DynamoDB Table for Terraform state locking    
resource "aws_dynamodb_table" "tf_lock_table" {
  name         = var.aws_dynamodb_table
  billing_mode = var.billing_mode
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name        = "dynamodb-tf-lock-table"
    Environment = "${var.env[0]}"
  }

}

module "iam-access" {
  source              = "./iam-access"
  aws_region          = var.aws_region
  bucket_name         = aws_s3_bucket.project_infinte.bucket
  dynamodb_table_name = aws_dynamodb_table.tf_lock_table.name
  account_id          = data.aws_caller_identity.current.account_id
}
