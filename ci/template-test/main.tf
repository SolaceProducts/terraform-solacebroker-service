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
}

# module "defaultvpn" {
#   source = "../../internal/gen-template"

#   msg_vpn_name           = "default"
#   enabled = false
# }
