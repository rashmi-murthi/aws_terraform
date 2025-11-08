variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-east-1"
}
variable "bucket_name" {
  description = "S3 bucket name for Terraform backend"
  default     = "project-infinte-terraform-state"
}

variable "dynamodb_table_name" {
  description = "DynamoDB table for Terraform locking"
  default     = "dynamodb-tf-lock-table"
}

variable "account_id" {
  description = "AWS account ID passed from root module" 
}
