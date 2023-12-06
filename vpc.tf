resource "aws_vpc" "eks_vpc" {
  cidr_block                       = "10.1.0.0/16"
  instance_tenancy                 = "default"
  enable_dns_hostnames             = true
  enable_dns_support               = true
  assign_generated_ipv6_cidr_block = false

  tags = {
    Name = "eks_vpc"
  }
}
output "vpc_id" {
  value = aws_vpc.eks_vpc.id

}
