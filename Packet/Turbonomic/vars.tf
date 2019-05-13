variable "packet_auth_token" {
  	description = "Your packet API key"
}

variable "packet_project_id" {
  	description = "Packet Project ID"
}

variable "packet_facility" {
  	description = "Packet facility: US East(ewr1), US West(sjc1), or EU(ams1). Default: sjc1"
  	default = "ewr1"
}

variable "aws_access_key_tf" {
  	description = "Your AWS access key"
}

variable "aws_secret_key_tf" {
	description = "Your AWS secret key"
}

variable "aws_region_tf" {
	description = "AWS Region to set as default"
	default = "us-east-1"
}

