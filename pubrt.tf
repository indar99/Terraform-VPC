resource "aws_route_table" "pubrt" {
  vpc_id = "${aws_vpc.davpc.id}"

  route {
    cidr_block = "${var.cidr2}"
#    gateway_id = "${aws_internet_gateway.pubigw.id}"
    vpc_peering_connection_id = "${aws_vpc_peering_connection.peer.id}"
  }


  tags = {
    Name = "pubrt"
  }
}

resource "aws_route_table_association" "pubrtass" {
  count = "${length(slice(local.azs_name,0,2))}"
  subnet_id      = "${aws_subnet.main.*.id[count.index]}"
  route_table_id = "${aws_route_table.pubrt.id}"
}

resource "aws_route_table" "testrt" {
  vpc_id = "${aws_vpc.davpc2.id}"

  route {
    cidr_block = "${var.vpc_cidr}"
#    gateway_id = "${aws_internet_gateway.testigw.id}"
    vpc_peering_connection_id = "${aws_vpc_peering_connection.peer.id}"
  }


  tags = {
    Name = "testrt"
  }
}

resource "aws_route_table_association" "testrtass" {
  count = "${length(slice(local.azs_name,0,2))}"
  subnet_id      = "${aws_subnet.main2.*.id[count.index]}"
  route_table_id = "${aws_route_table.testrt.id}"
}
