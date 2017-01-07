resource "digitalocean_droplet" "turbonomic" {
    image = "centos-7-x64"
    name = "turbonomic"
    region = "nyc2"
    size = "8gb"
    user_data = "${file("${path.module}/files/turbonomic-install.sh")}"
}


output "address_turbonomic" {
  value = "${digitalocean_droplet.turbonomic.ipv4_address}"
}