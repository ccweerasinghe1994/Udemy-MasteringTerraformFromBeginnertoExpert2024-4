terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0-beta3"
    }
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket" "my_external_bucket" {
  bucket = "not-managed-by-us"

}

variable "bucket_name" {
  type        = string
  description = "my variable bucket name"
  default     = "my_default_bucket_name"
}


output "bucket_id" {
  value = aws_s3_bucket.my_bucket.id
}

locals {
  local_example = "this is a local variable example"
}

module "my_module" {
  source = "./module-example"
}
