resource "vsphere_virtual_machine" "default" {
  name   = "machinename"
  folder = "foldername"
  vcpu   = 2
  memory = 8192
  datacenter = "datacentername"
  cluster = "clustername"
  resource_pool = "respoolname"

}