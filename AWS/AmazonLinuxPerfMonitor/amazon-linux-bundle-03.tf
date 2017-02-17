resource "aws_instance" "db1" {
    ami = "ami-c55673a0"
    instance_type = "t2.large"

    tags {
        Name = "db1"
        ProvisionedBy = "Terraform"
    }
}

resource "aws_instance" "db2" {
    ami = "ami-c55673a0"
    instance_type = "t2.large"

    tags {
        Name = "db2"
        ProvisionedBy = "Terraform"
    }
}

resource "aws_instance" "db3" {
    ami = "ami-c55673a0"
    instance_type = "t2.large"

    tags {
        Name = "db3"
        ProvisionedBy = "Terraform"
    }
}

