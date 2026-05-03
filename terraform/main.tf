# terraform/main.tf

# Llamada al módulo de IAM para crear los roles
module "iam" {
  source = "./modules/iam"
  env    = var.env
  suffix = var.suffix
}

# Llamada al módulo de S3 para crear el bucket
module "s3" {
  source = "./modules/s3"
  env    = var.env
  suffix = var.suffix
}

