# load_balancing variables

variable "vpc_name" {
  description = "Name of VPC, created for: naming vpc components"
  type = string
}

variable "security_group_id" {
  description = "security group allowing SSH, HTTP, HTTPS and internal webserver traffic, created for: asssigning to server instances to allow necessary traffic"
  type = string
}

variable "public_subnet_ids" {
  description = "list of public subnet ids, created for: assigning server instances to public subnets"
  type = list(string)
}

variable "server_names" {
  description = "list of server names, created for: assigning to server instances"
  type = list(string)
}

variable "vpc_id" {
  description = "id of main vpc, created for: assigning components to vpc"
  type = string
}