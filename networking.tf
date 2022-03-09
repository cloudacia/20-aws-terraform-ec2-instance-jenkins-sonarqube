# AWS VPC
resource "aws_vpc" "development" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "CI/CD Pipeline"
  }
}

# AWS SUBNET #1
resource "aws_subnet" "subnet01" {
  vpc_id               = aws_vpc.development.id
  cidr_block           = var.subnet01
  availability_zone_id = var.availability_zone01

  tags = {
    Name = "CI/CD Pipeline"
  }
}

# AWS ROUTING TABLE
resource "aws_route_table" "rt01" {
  vpc_id = aws_vpc.development.id

  tags = {
    Name = "CI/CD Pipeline"
  }
}

# AWS ROUTE ASSOCIATION
resource "aws_route_table_association" "rta01" {
  subnet_id      = aws_subnet.subnet01.id
  route_table_id = aws_route_table.rt01.id
}

# AWS INTERNET GATEWAY
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.development.id

  tags = {
    Name = "CI/CD Pipeline"
  }
}

# AWS ROUTE SETTING A NAT GATEWAY AS DEFAULT ROUTE
resource "aws_route" "internet_gateway" {
  route_table_id         = aws_route_table.rt01.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig.id
}
