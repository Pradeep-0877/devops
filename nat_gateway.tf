resource "aws_nat_gateway" "eks_nat-1" {
  allocation_id = aws_eip.mt_eip-1.id
  subnet_id     = aws_subnet.public-1.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  
}
resource "aws_nat_gateway" "eks_nat-2" {
  allocation_id = aws_eip.mt_eip-2.id
  subnet_id     = aws_subnet.public-2.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
#   depends_on = [aws_internet_gateway.my_IG]
}