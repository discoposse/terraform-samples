
output "Your IP Address for Turbostack01 is" {
	value = "${packet_device.turbostack01.network.0.address}"
}

output "Use this link to access Turbostack01 via http" {
  value = "http://${packet_device.turbostack01.network.0.address}/"
}