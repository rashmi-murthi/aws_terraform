
resource "aws_vpc" "demo_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.project_name}-${var.environment}-vpc"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.demo_vpc.id
  tags = {
    Name = "${var.project_name}-${var.environment}-igw"
  }
}
resource "aws_subnet" "public" {
  count                   = length(var.public_subnet)
  vpc_id                  = aws_vpc.demo_vpc.id
  cidr_block              = var.public_subnet[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}-${var.environment}-public-${count.index + 1}"
  }

}
resource "aws_subnet" "private" {
  count                   = length(var.private_subnet)
  cidr_block              = var.private_subnet[count.index]
  vpc_id                  = aws_vpc.demo_vpc.id
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.project_name}-${var.environment}-private-${count.index + 1}"
  }

}
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.demo_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.project_name}-${var.environment}-public-rt"
  }
}
resource "aws_route_table_association" "public_rta" {
  count          = length(var.public_subnet)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_rt.id

}
resource "aws_route_table" "private_rta" {
  vpc_id = aws_vpc.demo_vpc.id
  tags = {
    Name = "${var.project_name}-${var.environment}-private-rt"
  }

}
resource "aws_route_table_association" "private_rta_assoc" {
  count          = length(var.private_subnet)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_rta.id

}