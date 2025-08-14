terraform {
  backend "s3" {
    bucket         = "analytics-bp-terraform-state-uat-us7"
    key            = "infrastructure/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "analytics-bp-terraform-state-uat-us7-terraform-lock-table"
    encrypt        = true
  }
}

resource "aws_vpc" "vpc1" {
  cidr_block           = "10.100.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "VPC01"
  }
}

resource "aws_vpc" "vpc2" {
  cidr_block           = "10.200.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "VPC02"
  }
}
