# terraform/main.tf

module "iam" {
  source = "./modules/iam"
  env    = var.env
  suffix = var.suffix
}

module "s3" {
  source = "./modules/s3"  # <--- REVISA QUE ESTA LÍNEA ESTÉ ASÍ
  env    = var.env
  suffix = var.suffix
}

module "vpc" {
  source = "./modules/vpc"
  env    = var.env
}

module "sqs" {
  source = "./modules/sqs"
  env    = var.env
}