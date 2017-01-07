resource "digitalocean_droplet" "rancher" {
    image = "centos-7-x64"
    name = "rancher"
    region = "nyc2"
    size = "4gb"
    user_data = "${file("${path.module}/files/rancher-install.sh")}"
}

output "address_rancher" {
  value = "${digitalocean_droplet.rancher.ipv4_address}"
}