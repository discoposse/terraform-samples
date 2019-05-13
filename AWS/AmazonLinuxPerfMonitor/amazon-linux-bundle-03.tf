resource "aws_instance" "db1" {
    ami = "ami-a954d1cd"
    instance_type = "t2.medium"

    tags {
        Name = "db1"
        ProvisionedBy = "Terraform"
    }
}

resource "aws_instance" "db2" {
    ami = "ami-a954d1cd"
    instance_type = "t2.large"

    tags {
        Name = "db2"
        ProvisionedBy = "Terraform"
    }
}

resource "aws_instance" "db3" {
    ami = "ami-a954d1cd"
    instance_type = "t2.small"

    tags {
        Name = "db3"
        ProvisionedBy = "Terraform"
    }
}

