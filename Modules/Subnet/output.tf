output "public_subnet" {
  value = aws_subnet.amd-public-1.id
}

output "private_subnet" {
  value = aws_subnet.amd-private-1.id
}