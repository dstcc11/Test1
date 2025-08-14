module "circleci-aws-oidc" {
  source              = "./modules/oidc"
  circleci_org_id     = var.circleci_org_id
  circleci_project_id = var.circleci_project_id
}

module "backend" {
  source = "./modules/backend"
  region = var.region
  bucket = var.bucket
}