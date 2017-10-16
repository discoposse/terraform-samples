# Create a device and add it to digitalrebar-admin project
resource "packet_device" "digitalrebar-admin" {
  hostname         = "digitalrebar-admin.turbostack.io"
  plan             = "baremetal_0"
  operating_system = "ubuntu_16_04"
  billing_cycle    = "hourly"
  facility         = "${var.packet_facility}"
  project_id       = "${var.packet_project_id}"

  connection {
    user = "root"
    private_key = "${file("${var.packet_private_key}")}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y git",
      "curl -fsSL https://raw.githubusercontent.com/digitalrebar/digitalrebar/master/deploy/quickstart.sh -o /root/quickstart.sh",
      "bash /root/quickstart.sh"
    ]
  }
}

resource "aws_route53_record" "digitalrebar-admin" {
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "digitalrebar-admin.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "300"
  records = ["${packet_device.digitalrebar-admin.network.0.address}"]
}