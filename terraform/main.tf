# terraform/main.tf

module "iam" {
  source = "./modules/iam"
  env    = var.env
  suffix = var.suffix
}

module "s3" {
  source = "./modules/s3" # <--- REVISA QUE ESTA LÍNEA ESTÉ ASÍ
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

module "lambdas" {
  source          = "./modules/lambdas"
  env             = var.env
  upload_role_arn = module.iam.upload_lambda_role_arn
  crop_role_arn   = module.iam.crop_lambda_role_arn
  bucket_id       = module.s3.bucket_id
  queue_arn       = module.sqs.queue_arn
}

module "api" {
  source             = "./modules/api"
  env                = var.env
  upload_lambda_arn  = module.lambdas.upload_lambda_arn
  upload_lambda_name = module.lambdas.upload_lambda_name
}