# aws security variables

##
# constant local values
##
locals {
  ipv4_wildcard = "0.0.0.0/0"
  ipv6_wildcard = "::/0"

  # ports
  http = "80"
  https = "443"
  ssh = "22"
  api = "3000"
}

##
# variables
##
variable "vpc_id" {
  description = "id of main vpc, created for: assigning components to vpc"
  type = string
}
variable "app_name" {
  description = "Name of app, created for: naming vpc and components"
  type = string
}