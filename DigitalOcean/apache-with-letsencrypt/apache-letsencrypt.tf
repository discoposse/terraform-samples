resource "digitalocean_droplet" "apache-https" {
    image = "centos-7-x64"
    name = "apache-https"
    region = "nyc2"
    size = "2gb"
    ssh_keys = [
      "${var.digitalocean_ssh_fingerprint}"
    ]
    user_data = "${file("${path.module}/files/apache-letsencrypt-auto.sh")}"
    connection {
      user = "root"
      type = "ssh"
      key_file = "${var.digitalocean_private_key}"
      timeout = "2m"
  	}
}

output "address_apache-https" {
  value = "${digitalocean_droplet.apache-https.ipv4_address}"
}