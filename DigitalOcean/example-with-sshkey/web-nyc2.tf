resource "digitalocean_droplet" "web" {
    image = "ubuntu-16-04-x64"
    name = "webserver"
    region = "nyc2"
    size = "512mb"
    ssh_keys = [
      "${var.digitalocean_ssh_fingerprint}"
    ]
}

output "address_web" {
  value = "${digitalocean_droplet.web.ipv4_address}"
}
