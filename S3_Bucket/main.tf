provider "aws" {
  region = "us-east-1"
}
resource "aws_s3_bucket" "eleti_site" {
  bucket = "eleti-site.com"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket_public_access_block" "eleti_site_access" {
  bucket = aws_s3_bucket.eleti_site.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
resource "aws_s3_object" "upload" {
  bucket = aws_s3_bucket.eleti_site.id
  key    = "sample.jpg"
  source = "${path.module}/sample.jpg"
  etag   = filemd5("${path.module}/sample.jpg")
}

