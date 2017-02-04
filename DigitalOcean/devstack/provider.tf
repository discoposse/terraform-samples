variable "digitalocean_token" {}
variable "digitalocean_ssh_fingerprint" {}
variable "digitalocean_pub_key" {}
variable "digitalocean_private_key" {}

provider "digitalocean" {
  token = "${var.digitalocean_token}"
}
