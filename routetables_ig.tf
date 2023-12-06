resource "aws_internet_gateway" "my_IG" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    Name = "my_ig"
  }
}
# resource "aws_internet_gateway_attachment" "IG_attach" {
#   internet_gateway_id = aws_internet_gateway.my_IG.id
#   vpc_id              = aws_vpc.eks_vpc.id
# }
resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_IG.id
  }
  tags = {
    Name = "public_route"
  }
}
resource "aws_route_table" "private_route_1" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    #     gateway_id = aws_internet_gateway.my_IG
    nat_gateway_id = aws_nat_gateway.eks_nat-1.id
  }
  tags = {
    Name = "private_route_2"
  }
}
resource "aws_route_table" "private_route_2" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    #     gateway_id = aws_internet_gateway.my_IG
    nat_gateway_id = aws_nat_gateway.eks_nat-2.id
  }
  tags = {
    Name = "private_route_2"
  }
}
#eoute table to subnet assasiation
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public-1.id
  route_table_id = aws_route_table.public_route.id
}
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public-2.id
  route_table_id = aws_route_table.public_route.id
}
resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.private-2.id
  route_table_id = aws_route_table.private_route_1.id
}
resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.private-1.id
  route_table_id = aws_route_table.private_route_2.id
}