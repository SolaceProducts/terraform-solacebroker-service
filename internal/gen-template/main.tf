resource "solacebroker_msg_vpn" "main" {
  msg_vpn_name              = var.msg_vpn_name
  authentication_basic_type = var.authentication_basic_type
  dmr_enabled               = var.dmr_enabled
  enabled                   = var.enabled
  jndi_enabled              = var.jndi_enabled
  max_msg_spool_usage       = var.max_msg_spool_usage

  #AutoAddAttributes #EnableCommonVariables
}

resource "solacebroker_msg_vpn_client_profile" "default" {
  count = solacebroker_msg_vpn.main.msg_vpn_name != "default" ? 1 : 0

  msg_vpn_name                             = solacebroker_msg_vpn.main.msg_vpn_name
  client_profile_name                      = "default"
  allow_guaranteed_endpoint_create_enabled = true
  allow_guaranteed_msg_send_enabled        = true
  allow_guaranteed_msg_receive_enabled     = true
  allow_shared_subscriptions_enabled       = true
  allow_bridge_connections_enabled         = true
  allow_transacted_sessions_enabled        = true
}

resource "solacebroker_msg_vpn_acl_profile" "main" {
  count = var.acl_profile_name != "" ? 1 : 0

  msg_vpn_name     = solacebroker_msg_vpn.main.msg_vpn_name
  acl_profile_name = var.acl_profile_name

  #AutoAddAttributes #EnableCommonVariables
}

resource "solacebroker_msg_vpn_client_profile" "main" {
  count = var.client_profile_name != "" ? 1 : 0

  msg_vpn_name        = solacebroker_msg_vpn.main.msg_vpn_name
  client_profile_name = var.client_profile_name

  #AutoAddAttributes #EnableCommonVariables
}

# resource "solacebroker_msg_vpn_authentication_oauth_profile" "main" {
#   msg_vpn_name       = solacebroker_msg_vpn.main.msg_vpn_name
#   oauth_profile_name = var.oauth_profile_name
#   enabled             = var.enabled

# }

