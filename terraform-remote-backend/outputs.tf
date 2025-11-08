output "aws_s3_bucket" {
  value = aws_s3_bucket.project_infinte
}
output "aws_dynamodb_table" {
  value = aws_dynamodb_table.tf_lock_table
}
output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}