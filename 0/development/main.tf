resource "aws_vpc" "networking" {
  name        = "development-vpc"
  cidr        = "10.2.0.0/16"
  subnet_size = "small"
}

resource "aws_rds" "database" {
  name        = "development-databse"
  vpc_id      = aws_vpc.id
  server_size = "small"
}

resource "aws_eks" "kubernetes" {
  name         = "development-kubernetes"
  vpc_id       = aws_vpc.id
  cluster_size = "small"
}

resource "aws_this" "that" {}
// ...continued
