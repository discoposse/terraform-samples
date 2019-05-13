
output "Your IP Address for tap.turbostack.io is" {
	value = "${packet_device.tap.network.0.address}"
}

output "Use this link to access Turbonomic via http" {
  value = "http://${packet_device.tap.network.0.address}/"
}