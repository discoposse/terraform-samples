variable "digitalocean_token" {}

provider "digitalocean" {
  token = "${var.digitalocean_token}"
}
