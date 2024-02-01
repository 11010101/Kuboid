# servers_snapshot outputs

output "auto_scaling_group_ids" {
  value = aws_autoscaling_group.servers[*].id
}