variable "resource_group" {
  description = "The name of the resource group in which to create the virtual network."
  #default = "lauda"
}

variable "tag_owner" {
  description = "who owns the machine"
}

variable "tag_environment" {
  description = "staging, development, production"
}

variable "tag_application" {
  description = "what app does this machine run"
}

variable "rg_prefix" {
  description = "The shortened abbreviation to represent your resource group that will go on the front of some resources."
  default     = "rg"
}

variable "hostname" {
  description = "VM name referenced also in storage-related names."
  #default = "lauda"
}

variable "dns_name" {
  description = " Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system."
  #default = "lauda"
}

variable "lb_ip_dns_name" {
  description = "DNS for Load Balancer IP"
  default = "lauda"
}

variable "location" {
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
  default     = "southcentralus"
}

variable "virtual_network_name" {
  description = "The name for the virtual network."
  default     = "vnet"
}

variable "address_space" {
  description = "The address space that is used by the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
  default     = "10.0.0.0/16"
}

variable "subnet_prefix" {
  description = "The address prefix to use for the subnet."
  default     = "10.0.10.0/24"
}

variable "storage_account_tier" {
  description = "Defines the Tier of storage account to be created. Valid options are Standard and Premium."
  default     = "Premium"
}

variable "storage_replication_type" {
  description = "Defines the Replication Type to use for this storage account. Valid options include LRS, GRS etc."
  default     = "LRS"
}

variable "vm_size" {
  description = "Specifies the size of the virtual machine."
  default     = "Standard_D1_v2"
}

variable "image_publisher" {
  description = "name of the publisher of the image (az vm image list)"
  default     = "MicrosoftWindowsServer"
}

variable "image_offer" {
  description = "the name of the offer (az vm image list)"
  default     = "WindowsServer"
}

variable "image_sku" {
  description = "image sku to apply (az vm image list)"
  default     = "2012-R2-Datacenter"
}

variable "image_version" {
  description = "version of the image to apply (az vm image list)"
  default     = "latest"
}

variable "admin_username" {
  description = "administrator user name"
  default     = "turboadmin"
}

variable "admin_password" {
  description = "administrator password (recommended to disable password auth)"
  default = "Turbonomic1!"
}