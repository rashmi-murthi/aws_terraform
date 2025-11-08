provider "aws" {
  region = var.aws_region
}
# Create IAM Policy for backend access
resource "aws_iam_policy" "terraform_backend_access" {
  name        = "terraform-backend-access"
  description = "Allows DevOps team access to Terraform S3 & DynamoDB backend"

  # Load the text policy and replace placeholders
  policy = templatefile("${path.module}/policy.txt", {
    bucket_name         = var.bucket_name
    aws_region          = var.aws_region
    account_id          = var.account_id
    dynamodb_table_name = var.dynamodb_table_name
  })
}

# Create IAM Group for DevOps engineers
resource "aws_iam_group" "devops_team" {
  name = "DevOpsTeam"
}

# Attach the backend access policy to that group
resource "aws_iam_group_policy_attachment" "devops_policy_attach" {
  group      = aws_iam_group.devops_team.name
  policy_arn = aws_iam_policy.terraform_backend_access.arn
}