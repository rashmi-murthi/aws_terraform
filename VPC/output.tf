output "vpc_id" {
  value = aws_vpc.demo_vpc
}

output "public_subnets" {
  value = aws_subnet.public[*].id
}
output "aws_internet_gateway" {
  value = aws_internet_gateway.igw
}
/*output "aws_nat_gateway" {
    value = aws_nat_gateway.ngw
}*/