variable "aws_region" {
  type    = string
  default = "us-east-1"
}
variable "aws_s3_bucket" {
  type    = string
  default = "project-infinte-terraform-state"
}
variable "env" {
  type    = list(string)
  default = ["dev", "stage", "prod"]
}
variable "aws_dynamodb_table" {
  type    = string
  default = "tf-lock-table"
}
variable "billing_mode" {
  description = "The billing mode for the DynamoDB table"
  type        = string
  default     = "PAY_PER_REQUEST"
}
