resource "aws_security_group" "sshsg" {
  name        = "us-eas1-sg"
  description = "Allow ssh inbound traffic"
  vpc_id      = "${aws_vpc.davpc.id}"

  ingress {
    description = "public VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "us-east1-sg"
  }
}
