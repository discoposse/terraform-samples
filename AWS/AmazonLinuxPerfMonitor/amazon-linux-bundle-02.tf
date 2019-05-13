resource "aws_instance" "web4" {
    ami = "ami-a954d1cd"
    instance_type = "t2.small"

    tags {
        Name = "web4"
        ProvisionedBy = "Terraform"
    }
}

resource "aws_instance" "web5" {
    ami = "ami-a954d1cd"
    instance_type = "t2.small"

    tags {
        Name = "web5"
        ProvisionedBy = "Terraform"
    }
}

resource "aws_instance" "web6" {
    ami = "ami-a954d1cd"
    instance_type = "t2.medium"

    tags {
        Name = "web6"
        ProvisionedBy = "Terraform"
    }
}

