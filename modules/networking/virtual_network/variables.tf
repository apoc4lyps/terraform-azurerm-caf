variable "client_config" {
  description = "Client configuration object (see module README.md)."
  type        = any
}
variable "tags" {
  description = "(Required) map of tags for the deployment"
}

variable "diagnostics" {
  description = "(Required) Diagnostics object with the definitions and destination services"
}

variable "settings" {
  description = "(Required) configuration object describing the networking configuration, as described in README"
}

variable "application_security_groups" {
  default = {}
}

variable "network_security_group_definition" {}

variable "netwatcher" {
  description = "(Optional) is a map with two attributes: name, rg who describes the name and rg where the netwatcher was already deployed"
  default     = {}
}

variable "ddos_id" {
  description = "(Optional) ID of the DDoS protection plan if exists"
  default     = ""
}

variable "route_tables" {
  default = {}
}

variable "global_settings" {
  description = "Global settings object (see module README.md)"
  type        = any
}
variable "network_watchers" {
  default = {}
}
variable "network_security_groups" {
  default     = {}
  description = "Network Security Group cretaed with different Resource Group"
}
variable "remote_dns" {
  default = {}
}

variable "location" {
  description = "location of the resource if different from the resource group."
  type        = string
  default     = null
}
variable "resource_group_name" {
  description = "Resource group object to deploy the Azure resource"
  type        = string
  default     = null
}
variable "resource_group" {
  description = "Resource group object to deploy the Azure resource"
  type        = any
}
variable "base_tags" {
  description = "Base tags for the resource to be inherited from the resource group."
  type        = bool
}
