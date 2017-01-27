resource "vsphere_virtual_machine" "photonOS04" {
  name   = "photonOS04"
  vcpu   = 1
  memory = 2048
  datacenter = "DiscoMacbook"
  cluster = "CLUS-01"

  network_interface {
    label = "VM Network"
    ipv4_address = "172.16.223.164"
    ipv4_prefix_length = "24"
    ipv4_gateway = "172.16.223.2"
  }

  disk {
    template = "TMPL_photonOS"
    type = "thin"
    datastore = "datastore2"
  }
}

resource "vsphere_virtual_machine" "photonOS05" {
  name   = "photonOS05"
  vcpu   = 1
  memory = 2048
  datacenter = "DiscoMacbook"
  cluster = "CLUS-01"

  network_interface {
  	label = "VM Network"
  	ipv4_address = "172.16.223.165"
  	ipv4_prefix_length = "24"
  	ipv4_gateway = "172.16.223.2"
  }

  disk {
  	template = "TMPL_photonOS"
  	type = "thin"
    datastore = "datastore2"
  }
}

output "address_photonOS04" {
  value = "${vsphere_virtual_machine.photonOS04.network_interface.0.ipv4_address}"
}

output "address_photonOS05" {
  value = "${vsphere_virtual_machine.photonOS05.network_interface.0.ipv4_address}"
}