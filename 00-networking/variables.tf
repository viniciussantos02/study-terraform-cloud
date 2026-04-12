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