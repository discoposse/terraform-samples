resource "aws_instance" "web" {
    ami = "ami-c55673a0"
    instance_type = "t2.nano"

    tags {
        Name = "MyAmazonLinuxNano"
        ProvisionedBy = "Terraform"
    }
}
