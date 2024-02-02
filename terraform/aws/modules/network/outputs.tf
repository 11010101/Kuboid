# aws network outputs

output "vpc_id" {
  description = "id of main vpc, created for: assigning components to vpc"
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}