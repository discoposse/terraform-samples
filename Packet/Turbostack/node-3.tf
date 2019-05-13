# Create a device and add it to turbostack project
resource "packet_device" "turbostack03" {
  hostname         = "turbostack03.turbostack.io"
  plan             = "baremetal_0"
  operating_system = "vmware_esxi_6_5"
  billing_cycle    = "hourly"
  facility         = "${var.packet_facility}"
  project_id       = "${var.packet_project_id}"

  connection {
    user = "root"
    private_key = "${file("${var.packet_private_key}")}"
  }
  
  provisioner "remote-exec" {
    inline = [
      "esxcli network vswitch standard add --vswitch-name=vSwitch1",
      "esxcli network vswitch standard uplink add --uplink-name=vmnic1 --vswitch-name=vSwitch1",
      "esxcli network vswitch standard portgroup add --portgroup-name=machines --vswitch-name=vSwitch1",
      "esxcli network ip interface add --interface-name=vmk1 --portgroup-name=machines",
      "esxcli network ip interface ipv4 set --ipv4=${packet_device.turbostack03.network.2.address} --gateway=${packet_device.turbostack03.network.2.gateway} --netmask=255.255.255.248 --interface-name=vmk1 --type=static",
      "esxcli system account set -i root -p ${var.packet_vsphere_host_pass} -c ${var.packet_vsphere_host_pass}"
    ]
  }
}

resource "aws_route53_record" "turbostack03-pub" {
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "turbostack03-pub.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "300"
  records = ["${packet_device.turbostack03.network.0.address}"]
}

resource "aws_route53_record" "turbostack03-priv" {
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "turbostack03.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "300"
  records = ["${packet_device.turbostack03.network.2.address}"]
}