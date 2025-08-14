provider "aws" {
  region = var.region
}

locals {
  backend = {
    "Analytics_Backend" = {
      bucket = "analytics-bp-terraform-state-uat-us111"
    }
  }
}
resource "aws_s3_bucket" "terraform_state" {
  for_each = local.backend
  bucket   = each.value.bucket

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  for_each = local.backend
  bucket   = aws_s3_bucket.terraform_state[each.key].id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  for_each = local.backend
  bucket   = aws_s3_bucket.terraform_state[each.key].id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  for_each       = local.backend
  name           = "${each.value.bucket}-terraform-lock-table"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}