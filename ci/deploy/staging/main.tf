terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.72"
    }
  }

  backend "s3" {
    region = "ca-central-1"
  }
}

module "vpc" {
  source = "../modules/vpc"

  iac_tool               = var.iac_tool
  project                = var.project
  environment            = var.environment
  public_subnet_numbers  = var.public_subnet_numbers
  private_subnet_numbers = var.private_subnet_numbers
  redis_port             = var.redis_port
  postgres_port          = var.postgres_port
}

module "db" {
  source = "../modules/db"

  iac_tool               = var.iac_tool
  project                = var.project
  environment            = var.environment
  vpc_private_subnet_ids = module.vpc.vpc_private_subnet_ids
  postgres_port          = var.postgres_port
  app_security_group_id  = module.vpc.app_security_group_id
  postgres_password      = var.postgres_password
}

module "cache" {
  source = "../modules/cache"

  iac_tool               = var.iac_tool
  project                = var.project
  environment            = var.environment
  vpc_private_subnet_ids = module.vpc.vpc_private_subnet_ids
  redis_port             = var.redis_port
  app_security_group_id  = module.vpc.app_security_group_id
}

module "compute" {
  source = "../modules/compute"

  iac_tool               = var.iac_tool
  project                = var.project
  environment            = var.environment
  vpc_id                 = module.vpc.vpc_id
  vpc_public_subnet_ids  = module.vpc.vpc_public_subnet_ids
  vpc_private_subnet_ids = module.vpc.vpc_private_subnet_ids
  app_security_group_id  = module.vpc.app_security_group_id
  redis_host             = module.cache.redis_host
  redis_port             = module.cache.redis_port
  postgres_host          = module.db.postgres_host
  postgres_port          = module.db.postgres_port
  postgres_database      = module.db.postgres_database
  postgres_username      = module.db.postgres_username
  postgres_password      = var.postgres_password
  beanstalk_environment  = var.beanstalk_environment
}