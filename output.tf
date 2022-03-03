# VPC ID
output "vpc_id" {
  value = aws_vpc.big_data.id
}

# EC2 INSTANCE PUBLIC IP ADDRESS
output "ec_instance" {
  value = aws_instance.web01.public_ip
}
