# aws root main

module "network" {
  source = "./modules/network"

  app_name = var.app_name
  vpc_cidr = var.vpc_cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  availability_zones = var.availability_zones
}

module "security" {
  source = "./modules/security"

  app_name = var.app_name
  vpc_id = module.network.vpc_id
}

module "compute" {
  source = "./modules/compute"

  app_name = var.app_name
  security_group_id = module.security.security_group_kubernetes_cluster_id
  public_subnet_ids = module.network.public_subnet_ids
  key_name = "sshkey"
}