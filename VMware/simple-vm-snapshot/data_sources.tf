data "vsphere_datacenter" "dc" {
	name 			= "${var.vsphere_datacenter}"
}

data "vsphere_datastore" "datastore" {
	name 			= "${var.vsphere_datastore}"
	datacenter_id 	= "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
	name          	= "Development"
	datacenter_id 	= "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
	name          	= "DPG-AppNet"
	datacenter_id 	= "${data.vsphere_datacenter.dc.id}"
}

