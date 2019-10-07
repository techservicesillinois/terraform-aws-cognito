resource "aws_cognito_identity_provider" "default" {
  user_pool_id      = aws_cognito_user_pool.default.id
  provider_name     = var.provider_name
  provider_type     = var.provider_type
  provider_details  = var.provider_details
  attribute_mapping = var.attribute_mapping
}
