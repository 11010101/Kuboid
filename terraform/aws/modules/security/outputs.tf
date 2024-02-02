# aws security outputs

output "security_group_kubernetes_cluster_id" {
  description = "security group for network access, created for: assigning security rules to ec2"
  value = aws_security_group.kubernetes_cluster.id
}