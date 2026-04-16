terraform {
  required_providers {
    aws = {
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.assume_role.region

  default_tags {
    tags = var.tags
  }

  assume_role { #Usando assume role para dar permissao do terraform interagir com recursos da AWS. Ele cria access keys e secret keys temporarias
    role_arn = var.assume_role.arn
  }
}