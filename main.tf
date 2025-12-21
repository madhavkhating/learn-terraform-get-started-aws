module "network" {
  source = "./modules/vpc"

}

module "web-app" {
  source      = "./modules/compute"
  vpc_id      = module.network.learn_terraform_vpc_id
  subnet_id   = module.network.public_subnet_id
  subnet_id_2 = module.network.public_subnet_2_id
}

  