variable "name" {
  description = "(Required) Name of the Cognito User Pool"
}

##########################################################################
# App client settings
##########################################################################

variable "client_name" {
  description = "(Required) Name of the application client."
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

variable "supported_identity_providers" {
  description = "(Optional) List of provider names for the identity providers that are supported on this client."
  default     = []
}

# Domain name

variable "domain_name" {
  description = "(Required) Domain string."
}

##########################################################################
# Federation 
##########################################################################

# Identity providers

variable "provider_name" {
  description = "(Required) Provider name"
}

variable "provider_type" {
  description = "(Required) Provider type"
}

variable "provider_details" {
  description = "(Optional) Map of attribute mapping of user pool attributes"
  default     = {}
}

# Attribute mapping

variable "attribute_mapping" {
  description = "(Optional) Map of attribute mapping of user pool attributes"
  default     = {}
}
