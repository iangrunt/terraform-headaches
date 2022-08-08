module "vpc" {
  source = "./modules/networking"

  name = "development-vpc"

  cidr        = "10.2.0.0/16"
  subnet_size = "small"
}

module "aurora" {
  source = "../modules/data"

  name = "development-databse"

  vpc_id      = module.vpc.id
  server_size = "small"
}

module "eks-cluster" {
  source = "../modules/kubernetes"

  name = "development-kubernetes"

  vpc_id       = module.vpc.id
  cluster_size = "small"
}
