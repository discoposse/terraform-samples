resource "vsphere_virtual_machine" "photonOS01" {
  name   = "photonOS01"
  vcpu   = 1
  memory = 2048
  datacenter = "DiscoMacbook"
  cluster = "CLUS-01"

  network_interface {
  	label = "VM Network"
  }

  disk {
  	template = "TMPL_photonOS"
  	type = "thin"
    datastore = "datastore2"
  }
}

output "address_photonOS01" {
  value = "${vsphere_virtual_machine.photonOS01.network_interface.0.ipv4_address}"
}