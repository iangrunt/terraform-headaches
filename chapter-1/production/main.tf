module "vpc" {
  source = "./modules/networking"

  name = "production-vpc"

  cidr        = "10.1.0.0/16"
  subnet_size = "extra-large"
}

module "aurora" {
  source = "../modules/data"

  name = "production-databse"

  vpc_id      = module.vpc.id
  server_size = "extra-large"
}

module "eks-cluster" {
  source = "../modules/kubernetes"

  name = "production-kubernetes"

  vpc_id       = module.vpc.id
  cluster_size = "extra-large"
}

module "production-only" {
  source = "../modules/special-infrastructure"

  name        = "production-important"
  qubit_count = 1024
}
