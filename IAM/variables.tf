variable "project_devops_users" {
  type    = list(string)
  default = ["kala", "hara", "rudra", "lata", "maya", "jessica"]
}
variable "aws_region" {
  default = "us-east-1"
}