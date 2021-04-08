resource "aws_internet_gateway" "pubigw" {
  vpc_id = "${aws_vpc.davpc.id}"

  tags = {
    Name = "pubigw"
  }
}

resource "aws_internet_gateway" "testigw" {
  vpc_id = "${aws_vpc.davpc2.id}"

  tags = {
    Name = "testigw"
  }
}
