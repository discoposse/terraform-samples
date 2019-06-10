resource "vsphere_virtual_machine_snapshot" "snap" {
  count = 1
  virtual_machine_uuid = "${vsphere_virtual_machine.vm[count.index].uuid}"
  snapshot_name        = "terraform-snap of ${vsphere_virtual_machine.vm[count.index].name}"
  description          = "Snapped by Terraform"
  memory               = "true"
  quiesce              = "true"
  remove_children      = "false"
  consolidate          = "true"
}