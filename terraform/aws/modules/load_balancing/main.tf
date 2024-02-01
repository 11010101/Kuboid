# load_balancing main

resource "aws_lb" "web_servers" {
  name               = "${var.vpc_name}-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.public_subnet_ids

  tags = {
    ManagedBy = "Terraform"
  }
}

##
# listener, listener rules
##
resource "aws_lb_listener" "web_traffic" {
  load_balancer_arn = aws_lb.web_servers.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      status_code = 200
      message_body = "{msg: Invalid endpoint}"
    }
  }
  tags = {
    Name = "${var.vpc_name}-http-listener"
    ManagedBy = "Terraform"
  }
}
resource "aws_lb_listener_rule" "web_servers" {
  count = length(var.server_names)
  listener_arn = aws_lb_listener.web_traffic.arn

  condition {
    path_pattern {
      values = ["/api/${var.server_names[count.index]}*"]
    }
  }
  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.web_servers[count.index].arn
  }
  tags = {
    Name = "${var.vpc_name}-${var.server_names[count.index]}-listener-rule"
    ManagedBy = "Terraform"
  }
}

##
# target groups
##
resource "aws_lb_target_group" "web_servers" {
  count = length(var.server_names)

  name             = "${var.vpc_name}-${var.server_names[count.index]}-lb-target"
  port             = 3000
  protocol         = "HTTP"
  protocol_version = "HTTP1"
  target_type      = "instance"
  vpc_id           = var.vpc_id
  
  health_check {
    enabled  = true
    path     = "/api/${var.server_names[count.index]}/health"
    port     = 3000
    protocol = "HTTP"
  }

  tags = {
    ManagedBy = "Terraform"
  }
}
