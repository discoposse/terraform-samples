resource "vsphere_compute_cluster" "compute_cluster" {
  name            = "terraform-compute-cluster-example"
  datacenter_id   = "${data.vsphere_datacenter.dc.id}"
  host_system_ids = "${data.vsphere_host.hosts.*.id}"

  drs_enabled          = true
  drs_automation_level = "fullyAutomated"

  ha_enabled = true
}

resource "vsphere_compute_cluster_host_group" "cluster_host_group" {
  name                = "terraform-test-cluster-host-group"
  compute_cluster_id  = "${vsphere_compute_cluster.compute_cluster.id}"
  host_system_ids     = "${data.vsphere_host.hosts.*.id}"
}