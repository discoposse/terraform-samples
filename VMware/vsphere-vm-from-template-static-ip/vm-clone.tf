resource "vsphere_virtual_machine" "photonOS02" {
  name   = "photonOS02"
  vcpu   = 1
  memory = 2048
  datacenter = "DiscoMacbook"
  cluster = "CLUS-01"

  network_interface {
    label = "VM Network"
    ipv4_address = "172.16.223.162"
    ipv4_prefix_length = "24"
    ipv4_gateway = "172.16.223.2"
  }

  disk {
    template = "TMPL_photonOS"
    type = "thin"
    datastore = "datastore2"
  }
}

output "address_photonOS02" {
  value = "${vsphere_virtual_machine.photonOS02.network_interface.0.ipv4_address}"
}