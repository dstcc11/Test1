terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket3079"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
