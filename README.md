# terraform-aws-cognito

Provide AWS Cognito User Pool and Identity Pool 


Example Usage
-----------------

This configuration creates an Cognito User Pool with with app clients and identity provider for Shibboleth OAuth2 Connect.


```hcl
module "cognito-userpool" {
    source = "git::git@github.com:techservicesillinois/terraform-aws-cognito.git//?ref=v1.0.0"

    name = "directory-editor-tf"

    ##########################################################################
    # App client settings
    ##########################################################################

    client_name = "directory-editor-tf"

    allowed_oauth_flows = [
      "code"
    ]

    allowed_oauth_scopes = [
      "email", 
      "openid", 
      "profile"
    ]

    callback_urls = [
      "http://localhost:3000"
    ]

    logout_urls = [ 
      "http://localhost:3000?action=logout"
    ]

    supported_identity_providers = [
      "shibboleth-test"
    ]

    domain_name = "directory-editor-tf"


    ##########################################################################
    # Federation settings
    ##########################################################################

    provider_name = "shibboleth-test"
    provider_type = "OIDC"

    provider_details = {
      authorize_scopes = "openid profile email"
      client_id        = "directory-editor-tf"
      client_secret    = "secret"
      attributes_request_method = "POST"
      oidc_issuer      = "https://shibboleth-test.techservices.illinois.edu"
    }

    attribute_mapping = {
      profile  = "preferred_username",
      mail     = "email",
      username = "sub"
    }

}
```


Argument Reference
-----------------

The following arguments are supported:

* `name` - (Required) The name of the user pool

* `client_name` - (Required) Name of the application client

* `allowed_oauth_flows` - List of allowed OAuth flows (code, implicit, client_credentials)

* `allowed_oauth_flows_user_pool_client` - Whether the client is allowed to follow the OAuth protocol when interacting with Cognito user pools

* `allowed_oauth_scopes` - List of allowed OAuth scopes (phone, email, openid, profile, and aws.cognito.signin.user.admin)

* `create_route53_record` - Set to false if Route53 record already exists

* `callback_urls` - List of allowed callback URLs for the identity providers

* `logout_urls` - List of allowed logout URLs for the identity providers

* `supported_identity_providers` - List of provider names for the identity providers that are supported on this client

* `domain_name` - (Required) Domain string

* `resource_server_identifier` - (Required) An identifier for the resource server

* `resource_server_name` - (Required) A name for the resource server

* `resource_server_scope` - List of Authorization Scope

* `provider_name` - (Required) Provider name

* `provider_type` - (Required) Provider type

* `provider_details` -  Map of attribute mapping of user pool attributes

* `attribute_mapping` - Map of attribute mapping of user pool attributes



Attributes Reference
--------------------

The following attributes are exported:

* `name` - The name of the user pool

Credits
--------------------

**Nota bene** the vast majority of the verbiage on this page was
taken directly from the Terraform manual, and in a few cases from
Amazon's documentation.

