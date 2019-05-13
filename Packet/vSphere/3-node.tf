# Configure the Packet Provider
provider "packet" {
  auth_token = "${var.packet_auth_token}"
}

# Create a device and add it to turbostack project
resource "packet_device" "turbostack01" {
  hostname         = "turbostack01"
  plan             = "baremetal_1"
  operating_system = "vmware_esxi_6_5"
  billing_cycle    = "hourly"
  facility         = "${var.packet_facility}"
  project_id       = "${var.packet_project_id}"
}

# Create a device and add it to turbostack project
#resource "packet_device" "turbostack02" {
#  hostname         = "turbostack01"
#  plan             = "baremetal_1"
# operating_system = "vmware_esxi_6_5"
#  billing_cycle    = "hourly"
#  facility         = "${var.packet_facility}"
#  project_id       = "${var.packet_project_id}"
#}

# Create a device and add it to turbostack project
#resource "packet_device" "turbostack03" {
#  hostname         = "turbostack01"
#  plan             = "baremetal_1"
#  operating_system = "vmware_esxi_6_5"
#  billing_cycle    = "hourly"
#  facility         = "${var.packet_facility}"
#  project_id       = "${var.packet_project_id}"
#}


