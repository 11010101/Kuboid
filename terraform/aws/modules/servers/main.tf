# servers_snapshot main

resource "aws_launch_template" "servers" {
  count = length(var.server_names)

  name          = "${var.vpc_name}-${var.server_names[count.index]}-server"
  description   = "launch template for ${var.server_names[count.index]} Server"
  image_id      = var.server_images[count.index]
  instance_type = var.server_type
  key_name      = var.key_name

  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    # each instance template dynamically assigned to a public subnet in different AZs
    # subnet_id = var.public_subnet_ids[count.index]
    security_groups = [var.security_group_id]
  }
  # checks for a user-data file for the each specific launch template
  user_data = fileexists("./user-data--${var.server_names[count.index]}-server.sh") ? filebase64("./user-data--${var.server_names[count.index]}-server.sh") : ""
}

resource "aws_autoscaling_group" "servers" {
  count = length(var.server_names)

  name                = "${var.vpc_name}-${var.server_names[count.index]}-auto-scaling-group"
  vpc_zone_identifier = var.public_subnet_ids
  # attach each auto scaling group to its load balancing target group
  target_group_arns = [var.target_group_arns[count.index]]

  min_size         = var.min_instances
  max_size         = var.max_instances
  desired_capacity = var.desired_instances

  launch_template {
    id      = aws_launch_template.servers[count.index].id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.vpc_name}-${var.server_names[count.index]}-server"
    propagate_at_launch = true
  }
  tag {
    key                 = "ManagedBy"
    value               = "Terraform"
    propagate_at_launch = true
  }
}
