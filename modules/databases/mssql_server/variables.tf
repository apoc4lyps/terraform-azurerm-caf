variable "global_settings" {
  description = "Global settings object (see module README.md)"
  type        = any
}
variable "client_config" {
  description = "Client configuration object (see module README.md)."
  type        = any
}
variable "settings" {
  description = "The settings for the Azure resource."
  type        = any
}
variable "resource_group_name" {
  description = "(Required) The name of the resource group where to create the resource."
  type        = string
}
variable "location" {
  description = "(Required) Specifies the supported Azure location where to create the resource. Changing this forces a new resource to be created."
  type        = string
}
variable "storage_accounts" {}
variable "azuread_groups" {}
variable "vnets" {}
variable "private_endpoints" {}
variable "resource_groups" {}
variable "resource_group" {}
variable "base_tags" {
  description = "Base tags for the resource to be inherited from the resource group."
  type        = bool
}
variable "private_dns" {
  default = {}
}
variable "keyvault_id" {}
variable "remote_objects" {}
