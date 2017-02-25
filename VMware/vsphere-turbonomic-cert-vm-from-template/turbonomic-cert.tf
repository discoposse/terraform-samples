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
    datastore = "${var.vsphere_datastore}"
  }

  # Rename and replace the license and login configuration files
  provisioner "remote-exec" {
      inline = [
      "mv /srv/tomcat/data/config/license.config.topology /srv/tomcat/data/config/license.config.topology.original",
      "mv /srv/tomcat/data/config/login.config.topology /srv/tomcat/data/config/login.config.topology.original",
      ]
      connection {
        type = "ssh"
        user = "${var.turbo_ssh_user}"
        password = "${var.turbo_ssh_pass}"
    }
  }

  # Copies the local license file
  provisioner "file" {
      source = "files/license.config.topology.scratch"
      destination = "/srv/tomcat/data/config/license.config.topology"
      connection {
        type = "ssh"
        user = "${var.turbo_ssh_user}"
        password = "${var.turbo_ssh_pass}"
    }
  }

  # Copies the local license file
  provisioner "file" {
      source = "files/login.config.topology.scratch"
      destination = "/srv/tomcat/data/config/login.config.topology"
      connection {
        type = "ssh"
        user = "${var.turbo_ssh_user}"
        password = "${var.turbo_ssh_pass}"
    }
  }
}

output "address_DiscoCert01" {
  value = "${vsphere_virtual_machine.DiscoCert01.network_interface.0.ipv4_address}"
}