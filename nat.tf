/* Elastic IP for NAT */
resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.internet_gateway]
}

/* NAT */
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = element(aws_subnet.private_subnet.*.id, 0)
  #  subnet_id = aws_subnet.public_subnet["us-east-1a"].id
  depends_on = [aws_internet_gateway.internet_gateway]
  tags = {
    Name        = "nat"
    Environment = "${var.environment}"
  }
}