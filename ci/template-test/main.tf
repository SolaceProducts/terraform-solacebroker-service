provider "solacebroker" {
  username = "admin"
  password = "admin"
  url      = "http://localhost:8080"
}

module "testvpn" {
  source = "../../internal/gen-template"

  msg_vpn_name        = "testvpn"
  acl_profile_name    = "testvpn-acl-profile"
  client_profile_name = "testvpn-client-profile"
  oauth_profile_name  = "testvpnOauthProfile"
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
  cert_matching_rule_name = "testvpnCertMatchingRule"
  cert_matching_rule_conditions = [
    {
      source = "issuer"
      expression = "C = CA, ST = Ontario, L = Kanata, O = Solace Systems, OU = IT, CN = *.messaging.solace"
    }
  ]
  cert_matching_rule_attribute_filters = [
    {
      filter_name = "testFilter"
      attribute_name = "username"
      attribute_value = "test"
    }
  ]
}

module "testvpn2" {
  source = "../../internal/gen-template"

  msg_vpn_name        = "testvpn2"
  acl_profile_name    = "testvpn-acl-profile2"
  client_profile_name = "testvpn-client-profile2"
}

module "defaultvpn" {
  source = "../../internal/gen-template"

  msg_vpn_name           = "default"
  enabled = false
}
