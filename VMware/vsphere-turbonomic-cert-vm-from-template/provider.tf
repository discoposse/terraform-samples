variable "vsphere_user" {}
variable "vsphere_password" {}
variable "vsphere_server" {}
variable "vsphere_cluster" {}
variable "vsphere_datacenter" {}
variable "vsphere_resource_pool" {}
variable "vsphere_datastore" {}
variable "vsphere_folder" {}
variable "cert_template" {}

# Configure the VMware vSphere Provider
provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"
  # if you have a self-signed cert
  allow_unverified_ssl = true
}