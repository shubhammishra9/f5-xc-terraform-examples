module "aws_cloud_credentials" {
  count = ("" == var.aws_cloud_credentials_name) ? 1 : 0

  source  = "f5devcentral/aws-cloud-credentials/xc"
  version = "0.0.3"

  name            = local.aws_site_name
  aws_access_key  = var.aws_create_iam_user ? null : coalesce(var.xc_aws_access_key, var.aws_access_key)
  aws_secret_key  = var.aws_create_iam_user ? null : coalesce(var.xc_aws_secret_key, var.aws_secret_key)
}
