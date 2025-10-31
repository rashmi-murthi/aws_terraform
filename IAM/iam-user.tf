resource "aws_iam_user" "users" {
  name  = var.project_devops_users[count.index]
  count = length(var.project_devops_users)
}
