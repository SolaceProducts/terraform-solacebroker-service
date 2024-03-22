# Output variable definitions

output "msg_vpn" {
  value       = try(solacebroker_msg_vpn.main, null)
  sensitive   = true
  description = "Message VPNs (Virtual Private Networks) allow for the segregation of topic space and clients. They also group clients connecting to a network of message brokers, such that messages published within a particular group are only visible to that group's clients"
}

output "acl_profile" {
  value       = try(solacebroker_msg_vpn_acl_profile.main, null)
  description = "An ACL Profile controls whether an authenticated client is permitted to establish a connection with the message broker or permitted to publish and subscribe to specific topics"
}

output "client_profile" {
  value       = try(solacebroker_msg_vpn_client_profile.main, null)
  description = "Client Profiles are used to assign common configuration properties to clients that have been successfully authorized"
}

output "oauth_profile" {
  value       = try(solacebroker_msg_vpn_authentication_oauth_profile.main, null)
  sensitive   = true
  description = "OAuth profiles specify how to securely authenticate to an OAuth provider"
}

output "oauth_profile_client_required_claims" {
  value       = try(solacebroker_msg_vpn_authentication_oauth_profile_client_required_claim.main, null)
  description = "Additional claims to be verified in the ID token"
}

output "oauth_profile_resource_server_required_claims" {
  value       = try(solacebroker_msg_vpn_authentication_oauth_profile_resource_server_required_claim.main, null)
  description = "Additional claims to be verified in the access token"
}

output "cert_matching_rule" {
  value       = try(solacebroker_msg_vpn_cert_matching_rule.main, null)
  description = "A Cert Matching Rule is a collection of conditions and attribute filters that all have to be satisfied for certificate to be acceptable as authentication for a given username"
}

output "cert_matching_rule_conditions" {
  value       = try(solacebroker_msg_vpn_cert_matching_rule_condition.main, null)
  description = "A Cert Matching Rule Condition compares data extracted from a certificate to a username attribute or an expression"
}

output "cert_matching_rule_attribute_filters" {
  value       = try(solacebroker_msg_vpn_cert_matching_rule_attribute_filter.main, null)
  description = "A Cert Matching Rule Attribute Filter compares a username attribute to a string"
}

