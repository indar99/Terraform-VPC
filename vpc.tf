
resource "aws_vpc" "davpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "datavpc"
  }
}

resource "aws_vpc" "davpc2" {
  cidr_block       = "${var.cidr2}"
  instance_tenancy = "default"

  tags = {
    Name = "datavpc2"
  }
}
