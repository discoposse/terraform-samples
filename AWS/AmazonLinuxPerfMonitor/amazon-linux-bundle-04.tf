resource "aws_instance" "live-db24" {
    ami = "ami-a954d1cd"
    instance_type = "t2.medium"

    tags {
        Name = "db1"
        ProvisionedBy = "Terraform"
    }
}

resource "aws_instance" "live-db29" {
    ami = "ami-a954d1cd"
    instance_type = "t2.large"

    tags {
        Name = "db2"
        ProvisionedBy = "Terraform"
    }
}

resource "aws_instance" "live-db35" {
    ami = "ami-a954d1cd"
    instance_type = "t2.small"

    tags {
        Name = "db3"
        ProvisionedBy = "Terraform"
    }
}

resource "aws_instance" "live-db36" {
    ami = "ami-a954d1cd"
    instance_type = "t2.small"

    tags {
        Name = "db3"
        ProvisionedBy = "Terraform"
    }
}

resource "aws_instance" "live-db39" {
    ami = "ami-a954d1cd"
    instance_type = "t2.small"

    tags {
        Name = "db3"
        ProvisionedBy = "Terraform"
    }
}