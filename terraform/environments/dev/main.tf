module "vpc" {
  source = "../../modules/vpc"

  vpc_name             = "ciap-dev-vpc"
  vpc_cidr             = var.vpc_cidr
  public_subnet_1_cidr = var.public_subnet_1_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr

  az_1 = var.az_1
  az_2 = var.az_2
}


module "eks" {
  source = "../../modules/eks"

  cluster_name       = "ciap-dev-eks"
  public_subnet_1_id = module.vpc.public_subnet_1_id
  public_subnet_2_id = module.vpc.public_subnet_2_id
}


