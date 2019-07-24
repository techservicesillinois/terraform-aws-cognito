data "aws_caller_identity" "current" {}

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
