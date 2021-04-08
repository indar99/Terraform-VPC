locals {
  azs_name = "${data.aws_availability_zones.azs.names}" 
}

resource "aws_subnet" "main" {
  count = "${length(slice(local.azs_name,0,2))}"
  vpc_id     = "${aws_vpc.davpc.id}"
  cidr_block = "${cidrsubnet(var.vpc_cidr,2,count.index)}"
  availability_zone = "${local.azs_name[count.index]}"

  tags = {
    Name = "${local.azs_name[count.index]}-pub"
  }
}

resource "aws_subnet" "main2" {
  count = "${length(slice(local.azs_name,0,2))}"
  vpc_id     = "${aws_vpc.davpc2.id}"
  cidr_block = "${cidrsubnet(var.cidr2,2,count.index)}"
  availability_zone = "${local.azs_name[count.index]}"

  tags = {
    Name = "test-${count.index}"
  }
}
