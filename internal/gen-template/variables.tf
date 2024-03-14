# Input variable definitions

# Required variables

variable "msg_vpn_name" {
  description = "The name of the Message VPN"
  type        = string
}

# Optional variables

variable "authentication_basic_type" {
  description = "The type of basic authentication for clients connecting to the Message VPN. Default is internal"
  type        = string
  default     = "internal"
}

variable "dmr_enabled" {
  description = "Enable or disable Dynamic Message Routing (DMR) for the Message VPN. Default is enabled"
  type        = bool
  default     = true
}

variable "enabled" {
  description = "Enable or disable the Message VPN. Default is enabled"
  type        = bool
  default     = true
}

variable "jndi_enabled" {
  description = "Enable or disable JNDI access for clients in the Message VPN"
  type        = bool
  default     = true
}

variable "max_msg_spool_usage" {
  description = "The maximum message spool usage by the Message VPN, in megabytes"
  type        = number
  default     = 1500
}

variable "acl_profile_name" {
  description = "The name of the ACL Profile to be added to the Message VPN. If not specified, no ACL Profile will be added. Default is \"\""
  type        = string
  default     = ""
}


variable "client_profile_name" {
  description = "The name of the Client Profile to be added to the Message VPN. If not specified, no Client Profile will be added. Default is \"\""
  type        = string
  default     = ""
}

#AutoAddAttributes
