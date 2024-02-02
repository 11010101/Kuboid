# aws compute main

resource "aws_instance" "main" {
  ami           = "ami-0780837dd83465d73"
  instance_type = "t2.micro"
  security_groups = [var.security_group_id]
  key_name = var.key_name
  associate_public_ip_address = true
  subnet_id = var.public_subnet_ids[0]

  tags = {
    Name = "${var.app_name}-ec2"
    ManagedBy = "Terraform"
  }
}