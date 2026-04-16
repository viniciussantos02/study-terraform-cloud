resource "aws_s3_bucket" "this" { #Cria um bucket S3 na AWS. Aqui para usar como remote backend
  bucket = var.remote_backend.s3_bucket_name

  tags = {
    Name = var.remote_backend.s3_bucket_name
  }
}

resource "aws_s3_bucket_versioning" "this" { #Habilita o versionamento, ou seja, novos arquivos com o mesmo nome nao serao substituidos, e sim versionados.
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}