# Configure the Packet Provider
provider "packet" {
  auth_token = "${var.packet_auth_token}"
}

# Configure the AWS provider
provider "aws" {
    access_key = "${var.aws_access_key_tf}"
    secret_key = "${var.aws_secret_key_tf}"
    region = "${var.aws_region_tf}"
}

