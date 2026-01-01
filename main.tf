module "network" {
  source = "./modules/vpc"
}

module "web-app" {
  source     = "./modules/compute"
  vpc_id     = module.network.learn_terraform_vpc_id
  subnet_ids = module.network.public_subnet_ids
}
  