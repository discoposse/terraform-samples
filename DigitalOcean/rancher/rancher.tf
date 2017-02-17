resource "digitalocean_droplet" "rancher" {
    image = "centos-7-x64"
    name = "rancher"
    region = "nyc2"
    size = "4gb"
    ssh_keys = [
      "${var.digitalocean_ssh_fingerprint}"
    ]
    user_data = "${file("${path.module}/files/rancher-install.sh")}"
    connection {
      user = "root"
      type = "ssh"
      key_file = "${var.digitalocean_private_key}"
      timeout = "2m"
  	}
}

output "address_rancher" {
  value = "${digitalocean_droplet.rancher.ipv4_address}"
}