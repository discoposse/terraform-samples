resource "aws_instance" "web1" {
    ami = "ami-c55673a0"
    instance_type = "t2.small"

    tags {
        Name = "web1"
        ProvisionedBy = "Terraform"
    }
}

resource "aws_instance" "web2" {
    ami = "ami-c55673a0"
    instance_type = "t2.small"

    tags {
        Name = "web2"
        ProvisionedBy = "Terraform"
    }
}

resource "aws_instance" "web3" {
    ami = "ami-c55673a0"
    instance_type = "t2.small"

    tags {
        Name = "web3"
        ProvisionedBy = "Terraform"
    }
}

