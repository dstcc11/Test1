module "circleci-aws-oidc" {
  source              = "./modules/"
  circleci_org_id     = var.circleci_org_id
  circleci_project_id = var.circleci_project_id
}