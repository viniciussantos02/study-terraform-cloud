variable "tags" {
  type = map(string)
  default = {
    Environment = "production"
    Project     = "study-vini-dev"
  }
}

variable "assume_role" {
  type = object({
    arn    = string
    region = string
  })

  default = {
    arn    = "arn:aws:iam::593504800789:role/study-vini-role"
    region = "us-east-1"
  }
}

variable "remote_backend" {
  type = object({
    s3_bucket_name               = string
    dynamodb_table_name          = string
    dynamodb_table_billing_mode  = string
    dynamodb_table_hash_key      = string
    dynamodb_table_hash_key_type = string
  })

  default = {
    s3_bucket_name               = "study-vini-remote-backend-bucket"
    dynamodb_table_name          = "study-vini-state-locking-table"
    dynamodb_table_billing_mode  = "PAY_PER_REQUEST"
    dynamodb_table_hash_key      = "LockID"
    dynamodb_table_hash_key_type = "S"
  }
}