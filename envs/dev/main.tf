module "vpc" {
  source         = "../../modules/vpc"
  region     = var.aws_region
  vpc_cidr       = var.vpc_cidr
  public_subnet = var.public_subnet
  private_subnet = var.private_subnet
  project_name   = var.project_name
  environment    = var.environment
}
