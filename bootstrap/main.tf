module "circleci-aws-oidc" {
  source              = "./modules/oidc"
  circleci_org_id     = "4e652c93-6680-408c-a7b3-c8028ea01027"
  circleci_project_id = "a433077e-1fb5-4046-bf03-6e4e42083d58"
}

module "backend" {
  source = "./modules/backend"
  region = "us-east-1"
  bucket = "analytics-bp-terraform-state-uat-us007"
}