variable "aws_region" {
  description = "This region is for stage"
  type        = string
}
variable "environment" {
  description = "Environment type (e.g. dev, prod)"
  type        = string
}
variable "project_name" {
  description = "application name"
  type        = string
}
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}
variable "public_subnet" {
  description = "Public subnet CIDRs for stage environment"
  type        = list(string)
}
variable "private_subnet" {
  description = "private subnet cidrs for stage env"
  type        = list(string)
}