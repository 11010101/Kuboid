# security outputs

output "security_group_load_balancer_id" {
  description = "security group for load balancer, created for: assigning security rules to load balancer"
  value = aws_security_group.load_balancer.id
}

output "security_group_api_instance_id" {
    description = "security group for api instances, created for: assigning security rules to api instances"
  value = aws_security_group.api_instance.id
}