terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.73"
    }
  }

  backend "s3" {
    region = "ca-central-1"
    bucket = "thecloudprofessional-docker-multi-container-deployment"
    key    = "iac/prebuild/terraform.tfstate"
  }
}

## Create ECR repositories
resource "aws_ecr_repository" "modules" {
  for_each = var.project_modules

  name = "${var.project}_${each.key}"

  image_scanning_configuration {
    scan_on_push = false
  }

  tags = {
    Name      = "${var.project}"
    ManagedBy = "${var.iac_tool}"
  }
}

resource "aws_ecr_lifecycle_policy" "modules" {
  for_each = var.project_modules

  repository = aws_ecr_repository.modules[each.key].name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "keep last 3 images"
      action = {
        type = "expire"
      }
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 3
      }
    }]
  })
}