provider "solacebroker" {
  username = "admin"
  password = "admin"
  url      = "http://localhost:8080"
}

module "testvpn" {
  source = "../.."

  msg_vpn_name           = "myvpn"

  // Enable and configure incoming messaging protocols, for example REST. Note that plain text is not recommended for production use.
  service_rest_incoming_plain_text_enabled  = true
  service_rest_incoming_plain_text_listen_port = 9000

  // No need to set the VPN enabled, it defaults to true
  // enabled = true
}

output "created_vpn" {
  value     = module.testvpn.msg_vpn
  sensitive = true
}
