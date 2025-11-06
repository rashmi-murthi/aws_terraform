variable "region" {
  description = "The AWS region to create resources in"
  type        = string

}
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}
variable "public_subnet" {
  type = list(string)
}
variable "private_subnet" {
  type = list(string)
}
variable "project_name" {
  type = string
}
variable "environment" {
  type = string
}