variable "aws_region" {
  description = "This aws region is for dev"
  type = string
}
variable "environment" {
    description = "Environment type (e.g. dev, prod)"
  type = string
}
variable "project_name" {
    description = "application name"
   type = string
}
variable "vpc_cidr" {
    description = "CIDR block for the VPC"
  type = string
}   
variable "public_subnet" {
  description = "Public subnet CIDRs for dev environment"
  type        = list(string)
}
variable "private_subnet" {
  description = "private subnet cidrs for dev env"
  type        = list(string)
}
