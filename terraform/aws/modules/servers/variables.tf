# servers_snapshot variables

variable "public_subnet_ids" {
  description = "list of public subnet ids, created for: assigning server instances to public subnets"
  type = list(string)
}

variable "security_group_id" {
  description = "security group allowing SSH, HTTP, HTTPS and internal webserver traffic, created for: asssigning to server instances to allow necessary traffic"
  type = string
}

variable "vpc_name" {
  description = "Name of VPC, created for: naming vpc components"
  type = string
}

variable "key_name" {
  description = "name of aws key pair used to ssh to instance, created for: assigning to server instances"
  type = string
}

variable "server_names" {
  description = "list of server names, created for: assigning to server instances"
  type = list(string)
}

variable "server_images" {
  description = "AWS AMI images for specific server, created for: launch template for auto scaling group"
  type = list(string)
}

variable "server_type" {
  description = "type of instance for servers, created for: launch template for auto scaling group"
  type = string
}

variable "min_instances" {
  description = "minimum number of instances, created for: auto scaling group"
  type = string
}
variable "max_instances" {
  description = "maximum number of instances, created for: auto scaling group"
  type = string
}
variable "desired_instances" {
  description = "desired number of instances, created for: auto scaling group"
  type = string
}

variable "target_group_arns" {
  description = "arns of load balancer target groups, created for: ataching autoscaling groups to load balancer"
  type= list(string)
}