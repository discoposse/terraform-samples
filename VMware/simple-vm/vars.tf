variable "vsphere_user" {
	type = "string"
	description = "Username used to connect to vCenter or the vSphere host"
}
variable "vsphere_password" {
	type = "string"
	description = "Password used to connect to vCenter or the vSphere host"
}
variable "vsphere_server" {
	type = "string"
	description = "vCenter server or vSphere host name"
}
variable "vsphere_cluster" {
	type = "string"
	description = "Cluster in which to put your virtual machine"
}
variable "vsphere_datacenter" {
	type = "string"
	description = "Datacenter to put the virtual machine into"
}
variable "vsphere_datastore" {
	type = "string"
	description = "Datastore to put the virtual machine disks onto"
}
variable "wait_for_guest_net_timeout" {
	type = "string"
	description = "Do you want to wait for DHCP?"
}
variable "photon_user" {
	type = "string"
	description = "User to attach to the PhotonOS guest"
}
variable "photon_password" {
	type = "string"
	description = "Password for the PhotonOS accounmt"
}

