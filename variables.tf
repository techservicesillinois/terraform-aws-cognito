variable "name" {
  description = "(Required) The name of the Cognito User Pool"
}

##########################################################################
# App client settings
##########################################################################

variable "client_name" {
  description = "(Required) The name of the application client."
}

variable "allowed_oauth_flows" {
  description = "(Optional) List of allowed OAuth flows (code, implicit, client_credentials)."
  default     = []
}

variable "allowed_oauth_flows_user_pool_client" {
  description = "(Optional) Whether the client is allowed to follow the OAuth protocol when interacting with Cognito user pools."
  default     = true
}

variable "allowed_oauth_scopes" {
  description = "(Optional) List of allowed OAuth scopes (phone, email, openid, profile, and aws.cognito.signin.user.admin)."
  default     = []
}

variable "callback_urls" {
  description = "(Optional) List of allowed callback URLs for the identity providers."
  default     = []
}

# Domain name

variable "domain_name" {
  description = "(Required) The domain string."
}

