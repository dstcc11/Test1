terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket3079"
    key            = "infrastructure/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}

resource "aws_vpc" "vpc1" {
  cidr_block           = "10.100.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "VPC1"
  }
}

resource "aws_vpc" "vpc2" {
  cidr_block           = "10.200.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "VPC2"
  }
}
