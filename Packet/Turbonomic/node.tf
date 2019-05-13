# Configure the Packet Provider
provider "packet" {
  auth_token = "${var.packet_auth_token}"
}

# Configure the AWS provider
provider "aws" {
    access_key = "${var.aws_access_key_tf}"
    secret_key = "${var.aws_secret_key_tf}"
    region = "${var.aws_region_tf}"
}

# Create a device and add it to turbostack project
resource "packet_device" "tap" {
  hostname         = "tap.turbostack.io"
  plan             = "baremetal_0"
  operating_system = "centos_7"
  billing_cycle    = "hourly"
  facility         = "${var.packet_facility}"
  project_id       = "${var.packet_project_id}"
  user_data = "${file("${path.module}/files/turbonomic-install.sh")}"
}

data "aws_route53_zone" "selected" {
  name         = "turbostack.io."
  private_zone = false
}

resource "aws_route53_record" "tap" {
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "tap.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "300"
  records = ["${packet_device.tap.network.0.address}"]
}