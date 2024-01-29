# root main

module "network" {
  source = "./modules/network"

  app_name = "kuboid"
}