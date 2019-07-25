resource "aws_cognito_user_pool" "default" {
  name = "${var.name}"
}

resource "aws_cognito_user_pool_client" "default" {
  name                                 = "${var.client_name}"
  allowed_oauth_flows                  = ["${var.allowed_oauth_flows }"]
  allowed_oauth_flows_user_pool_client = "${var.allowed_oauth_flows_user_pool_client  }"
  allowed_oauth_scopes                 = ["${var.allowed_oauth_scopes}"]
  callback_urls                        = ["${var.callback_urls}"]

  user_pool_id = "${aws_cognito_user_pool.default.id}"
}

resource "aws_cognito_user_pool_domain" "main" {
  domain       = "${var.domain_name}"
  user_pool_id = "${aws_cognito_user_pool.default.id}"
}

resource "aws_cognito_identity_provider" "default" {
  user_pool_id  = "${aws_cognito_user_pool.default.id}"
  provider_name = "${var.provider_name}"
  provider_type = "${var.provider_type}"

  provider_details = "${var.provider_details}"

  attribute_mapping = "${var.attribute_mapping}"
}
