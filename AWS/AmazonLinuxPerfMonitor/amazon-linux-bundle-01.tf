resource "aws_instance" "web1" {
    ami = "ami-a954d1cd"
    instance_type = "t2.medium"

    tags {
        Name = "web1"
        ProvisionedBy = "Terraform"
    }
}

resource "aws_instance" "web2" {
    ami = "ami-a954d1cd"
    instance_type = "t2.medium"

    tags {
        Name = "web2"
        ProvisionedBy = "Terraform"
    }
}

resource "aws_instance" "web3" {
    ami = "ami-a954d1cd"
    instance_type = "t2.xlarge"

    tags {
        Name = "web3"
        ProvisionedBy = "Terraform"
    }
}

