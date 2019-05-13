
output "Your Public IPv4 Address for turbostack01.turbostack.io is" {
	value = "${packet_device.turbostack01.network.0.address}"
}
output "Your Private IPv4 Address for turbostack01.turbostack.io is" {
	value = "${packet_device.turbostack01.network.2.address}"
}
output "Your Public IPv4 Address for turbostack02.turbostack.io is" {
	value = "${packet_device.turbostack02.network.0.address}"
}
output "Your Private IPv4 Address for turbostack02.turbostack.io is" {
	value = "${packet_device.turbostack02.network.2.address}"
}
output "Your Public IPv4 Address for turbostack03.turbostack.io is" {
	value = "${packet_device.turbostack03.network.0.address}"
}
output "Your Private IPv4 Address for turbostack03.turbostack.io is" {
	value = "${packet_device.turbostack03.network.2.address}"
}
output "Your Public IPv4 Address for turbostack04.turbostack.io is" {
	value = "${packet_device.turbostack04.network.0.address}"
}
output "Your Private IPv4 Address for turbostack04.turbostack.io is" {
	value = "${packet_device.turbostack04.network.2.address}"
}