resource "digitalocean_droplet" "devstack-do" {
    image = "ubuntu-16-04-x64"
    name = "devstack-do"
    region = "nyc2"
    size = "8gb"
    ssh_keys = [
      "${var.digitalocean_ssh_fingerprint}"
    ]
    user_data = "${file("${path.module}/files/devstack-install.sh")}"
    connection {
      user = "root"
      type = "ssh"
      key_file = "${var.digitalocean_private_key}"
      timeout = "2m"
  	}
}

output "address_devstack-do" {
  value = "${digitalocean_droplet.devstack-do.ipv4_address}"
}

output "dashboard-do" {
  value = "http://${digitalocean_droplet.devstack-do.ipv4_address}/dashboard"
}