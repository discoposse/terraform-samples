resource "vsphere_virtual_machine" "DiscoCert01" {
  name   = "DiscoCert01"
  folder = "${var.vsphere_folder}"
  vcpu   = 2
  memory = 8192
  datacenter = "${var.vsphere_datacenter}"
  cluster = "${var.vsphere_cluster}"
  #resource_pool = "${var.vsphere_resource_pool}"
  skip_customization = 1


  network_interface {
  	label = "${var.cert_template_network}"
  }

  disk {
  	template = "${var.cert_template}"
  	type = "thin"
    datastore = "${var.vsphere_cluster}"
  }

}