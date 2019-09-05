provider "restapi" {
  uri                  = "${var.turbonomic_rest_endpoint}"
  debug                = true
  write_returns_object = true
  insecure			   = true
  username			   = "${var.turbonomic_user}"
  password			   = "${var.turbonomic_password}"
}


