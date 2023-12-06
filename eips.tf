resource "aws_eip" "mt_eip-1" {
#   domain            = "vpc"
#   network_interface = aws_network_interface.multi-ip.id
  #   associate_with_private_ip = "10.1.0.10"
  depends_on = [aws_internet_gateway.my_IG]
}
resource "aws_eip" "mt_eip-2" {
#   domain            = "vpc"
#   network_interface = aws_network_interface.multi-ip.id
  #   associate_with_private_ip = "10.1.0.10"
  depends_on = [aws_internet_gateway.my_IG]

}