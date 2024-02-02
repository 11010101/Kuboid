# servers_snapshot variables

variable "public_subnet_ids" {
  description = "list of public subnet ids, created for: assigning server instances to public subnets"
  type = list(string)
}

variable "security_group_id" {
  description = "security group allowing SSH, HTTP, HTTPS and internal webserver traffic, created for: asssigning to server instances to allow necessary traffic"
  type = string
}

variable "app_name" {
  description = "Name of app, created for: naming vpc and components"
  type = string
}

variable "key_name" {
  description = "name of aws key pair used to ssh to instance, created for: assigning to server instances"
  type = string
}