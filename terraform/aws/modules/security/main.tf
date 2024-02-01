# security main

resource "aws_security_group" "load_balancer" {
  name        = "${var.vpc_name}-load-balancer-security-group"
  description = "Security group for load balancer"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    iterator = port
    for_each = [local.http, local.https, local.ssh, local.api]
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = [local.ipv4_wildcard]
      ipv6_cidr_blocks = [local.ipv6_wildcard]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [local.ipv4_wildcard]
    ipv6_cidr_blocks = [local.ipv6_wildcard]
  }

  tags = {
    ManagedBy = "Terraform"
  }
}

resource "aws_security_group" "api_instance" {
  name        = "${var.vpc_name}-api-instance-security-group"
  description = "Security group for api instances"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    iterator = port
    for_each = [local.http, local.https, local.ssh, local.api]
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = [local.ipv4_wildcard]
      ipv6_cidr_blocks = [local.ipv6_wildcard]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [local.ipv4_wildcard]
    ipv6_cidr_blocks = [local.ipv6_wildcard]
  }

  tags = {
    ManagedBy = "Terraform"
  }
}