module "vpc" {
#   source = "../vpc-module"
  source = "git::https://github.com/Sowjanya-Dev-secops/vpc-module.git?ref=main"
  vpc_cidr = var.vpc_cidr
  project_name = var.project_name
  environment = var.environment
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs
  
  

}