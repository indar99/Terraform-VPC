resource "aws_vpc_peering_connection" "peer" {
  peer_owner_id = "${var.owner_id}"
  peer_vpc_id   = "${aws_vpc.davpc.id}"
  vpc_id        = "${aws_vpc.davpc2.id}"
  auto_accept = "true"

  tags = {
    Name = "mypeering"
  }
  
}
