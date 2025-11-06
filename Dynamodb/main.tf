resource "aws_dynamodb_table" "marks_table" {
  name         = "StudentMarks"
  billing_mode = var.billing_mode
  hash_key     = var.hash_key
  range_key    = var.range_key
  attribute {
    name = "StudentID"
    type = "S"
  }
  attribute {
    name = "Subject"
    type = "S"
  }
}
output "aws_dynamodb_table" {
  value = aws_dynamodb_table.marks_table.name
}
