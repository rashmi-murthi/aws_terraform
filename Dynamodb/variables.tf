variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}
variable "billing_mode" {
  description = "The billing mode for the DynamoDB table"
  type        = string
  default     = "PAY_PER_REQUEST"
}
variable "hash_key" {
  description = "The hash key for the DynamoDB table"
  type        = string
  default     = "StudentID"
}
variable "range_key" {
  description = "The range key for the DynamoDB table"  
    type        = string    
    default     = "Subject"
}
