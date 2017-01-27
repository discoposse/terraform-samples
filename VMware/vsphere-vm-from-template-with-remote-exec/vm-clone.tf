resource "vsphere_virtual_machine" "photonOS07" {
  name   = "photonOS07"
  vcpu   = 1
  memory = 2048
  datacenter = "DiscoMacbook"
  cluster = "CLUS-01"

  network_interface {
  	label = "VM Network"
  }

  disk {
  	template = "TMPL_photonPass"
  	type = "thin"
    datastore = "datastore2"
  }

  # Run a script to create a file
  provisioner "remote-exec" {
      inline = [
      "touch /disco.txt",
      "echo 'DiscoPosse was Terraforming here' > /disco.txt"
      ]
      connection {
        type = "ssh"
        user = "root"
        password = "${var.photon_root_pass}"
    }
  }
}

output "address_photonOS07" {
  value = "${vsphere_virtual_machine.photonOS07.network_interface.0.ipv4_address}"
}