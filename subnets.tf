resource "aws_subnet" "public-1" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "us-east-1a"
  #theis assingns public ips defaultly
  map_public_ip_on_launch = true

  tags = {
    Name                        = "public-1_eat-1a"
    "Kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}
resource "aws_subnet" "private-1" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.1.2.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name                              = "private-1-eat-1a"
    "Kubernetes.io/cluster/eks"       = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}
resource "aws_subnet" "public-2" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.1.3.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name                        = "public-2_east-1b"
    "Kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}
resource "aws_subnet" "private-2" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.1.4.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name                              = "private-2_east-1b"
    "Kubernetes.io/cluster/eks"       = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}