output "virtual_machine_default_ips" {
	value = vsphere_virtual_machine.vm.*.name
}
