data "aws_ssm_parameter" "selected" {
  name = var.client_secret_ssm_path
}

locals {
  provider_details = merge(var.provider_details, { "client_secret" = data.aws_ssm_parameter.selected.value })
}

resource "aws_cognito_user_pool" "default" {
  name = var.name
}

resource "aws_cognito_user_pool_client" "default" {
  name                                 = var.client_name
  allowed_oauth_flows                  = var.allowed_oauth_flows
  allowed_oauth_flows_user_pool_client = var.allowed_oauth_flows_user_pool_client
  allowed_oauth_scopes                 = var.allowed_oauth_scopes
  callback_urls                        = var.callback_urls
  logout_urls                          = var.logout_urls
  supported_identity_providers         = [aws_cognito_identity_provider.default.provider_name]

  user_pool_id = aws_cognito_user_pool.default.id
}

resource "aws_cognito_user_pool_domain" "main" {
  domain       = var.domain_name
  user_pool_id = aws_cognito_user_pool.default.id
}

resource "aws_cognito_identity_provider" "default" {
  user_pool_id      = aws_cognito_user_pool.default.id
  provider_name     = var.provider_name
  provider_type     = var.provider_type
  provider_details  = local.provider_details
  attribute_mapping = var.attribute_mapping
}
