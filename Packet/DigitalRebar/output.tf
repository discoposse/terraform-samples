output "Your Public IPv4 Address for digitalrebar-admin.turbostack.io is" {
	value = "${packet_device.digitalrebar-admin.network.0.address}"
}