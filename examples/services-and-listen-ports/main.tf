provider "solacebroker" {
  username = "admin"
  password = "admin"
  url      = "http://localhost:8080"
}

module "testvpn" {
  source = "../.."

  msg_vpn_name           = "rest-enabled-vpn"

  // Enable and configure incoming messaging protocols, for example REST. Note that plain text is not recommended for production use.
  service_rest_incoming_plain_text_enabled  = true
  service_rest_incoming_plain_text_listen_port = 9001

  // Uncomment to disable plain text SMF - however secure transport SMF requires a server certificate installed on the broker
  // service_smf_plain_text_enabled = false

  // No need to set the VPN enabled, it defaults to true
  // enabled = true
}

output "created_vpn" {
  value     = module.testvpn.msg_vpn
  sensitive = true
}
