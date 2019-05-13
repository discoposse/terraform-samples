resource "aws_instance" "hashcat" {
    ami = "ami-52f7b345"
    instance_type = "g2.2xlarge"

    tags {
        Name = "hashcat"
        ProvisionedBy = "Terraform"
        Application = "hashcat"
    }
}
