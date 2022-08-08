resource "aws_vpc" "networking" {
  name        = "production-vpc"
  cidr        = "10.1.0.0/16"
  subnet_size = "extra-large"
}

resource "aws_rds" "database" {
  name        = "production-databse"
  vpc_id      = aws_vpc.id
  server_size = "extra-large"
}

resource "aws_eks" "kubernetes" {
  name         = "production-kubernetes"
  vpc_id       = aws_vpc.id
  cluster_size = "extra-large"
}

resource "aws_this" "that" {}
resource "aws_the" "other" {}
// ...and continued
