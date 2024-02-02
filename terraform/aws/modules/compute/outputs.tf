# aws compute outputs

output "instance" {
  description = "ip"
  value = aws_instance.main.public_ip
}