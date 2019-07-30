
resource "vsphere_virtual_machine" "vm" {
count			 = 4
name             = "terraform-test${count.index}"
resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
datastore_id     = "${data.vsphere_datastore.datastore.id}"
wait_for_guest_net_timeout = "${var.wait_for_guest_net_timeout}"

num_cpus = 2
memory   = 4096
guest_id = "other3xLinux64Guest"

network_interface {
  network_id = "${data.vsphere_network.network.id}"
}

disk {
  label = "disk0"
  size  = 20
  }
}

