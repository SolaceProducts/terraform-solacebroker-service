provider "solacebroker" {
  username = "admin"
  password = "admin"
  url      = "http://localhost:8080"
}

module "testvpn" {
  source = "../.."

  msg_vpn_name           = "vpn-with-oauth"
  // No need to set the VPN enabled, it defaults to true
  // enabled = true

  oauth_profile_name  = "sampleVpnOauthProfile"
  // with "oauth_profile_name" defined, OAuth authentication will be automatically enabled on the message VPN
  // no need to set the following:
  // authentication_oauth_enabled = true
  // this profile will also be set as the default OAuth profile, so no need to set the following:
  // authentication_oauth_default_profile_name = "sample-vpn-oauth-profile"

  // example additional configuration for the OAuth profile
  oauth_role = "resource-server"

  // example required claims in case of client role
  oauth_profile_client_required_claims = [
    {
      claim_name  = "audience"
      claim_value = "{ \"aud\": \"myAudience\" }"
    },
    {
      claim_name  = "sub"
      claim_value = "{ \"sub\": 123456789 }",
    }
  ]

  // example required claims in case of resource server role
  oauth_profile_resource_server_required_claims = [
    {
      claim_name  = "audience"
      claim_value = "{ \"aud\": \"myAudience\" }"
    },
    {
      claim_name  = "sub"
      claim_value = "{ \"sub\": 123456789 }",
    }
  ]
}

output "created_vpn" {
  value     = module.testvpn.msg_vpn
  sensitive = true
}

output "created_oauth_profile" {
  value     = module.testvpn.oauth_profile
  sensitive = true
}

output "created_oauth_profile_client_required_claims" {
  value = module.testvpn.oauth_profile_client_required_claims
}

output "created_oauth_profile_resource_server_required_claims" {
  value = module.testvpn.oauth_profile_resource_server_required_claims
}


