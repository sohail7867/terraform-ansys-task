resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = var.public_subnet
  depends_on    = [aws_eip.nat]

  tags = {
    Name = "nat-gateway"
  }
}
