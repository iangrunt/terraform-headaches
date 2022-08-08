module "networking" {
  source = "../modules/vpc"

  name = "production-vpc"

  cidr        = "10.1.0.0/16"
  subnet_size = "extra-large"
}

module "database" {
  source = "../modules/aurora"

  name = "production-databse"

  vpc_id      = module.vpc.id
  server_size = "extra-large"
}

module "kubernetes" {
  source = "../modules/eks"

  name = "production-kubernetes"

  vpc_id       = module.vpc.id
  cluster_size = "extra-large"
}
