
resource "aws_subnet" "privsub" {
  count = "${length(slice(local.azs_name,0,2))}"
  vpc_id     = "${aws_vpc.davpc.id}"
  cidr_block = "${cidrsubnet(var.vpc_cidr,2,count.index + length(slice(local.azs_name,0,2)))}"
  availability_zone = "${local.azs_name[count.index]}"

  tags = {
    Name = "${local.azs_name[count.index]}-priv"
  }
}
