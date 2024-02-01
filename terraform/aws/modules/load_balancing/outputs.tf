# load_balancing outputs

output "target_group_arns" {
  description = "arns of load balancer target groups, created for: ataching autoscaling groups to load balancer"
  value = aws_lb_target_group.web_servers[*].arn
}