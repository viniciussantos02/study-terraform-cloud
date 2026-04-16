terraform {
  required_providers {
    aws = {
      version = "~> 6.0"
    }
  }

  backend "s3" { #Configura o bucket s3 onde o arquivo tfstate sera salvo e versionado
    bucket = "study-vini-remote-backend-bucket"
    key    = "networking/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true #Aqui para configurar o state locking no S3 (mais moderno e mais simples pois so provisiona um unico recurso)
    #dynamodb_table = "study-vini-state-locking-table" #config para state locking no dynamoDB
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