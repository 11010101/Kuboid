# network variables

variable "app_name" {
  description = "name of the app for component naming"
}

variable "vpc_cidr_block" {
  description = "cidr block for the vpc"
  default = "192.168.0.0/20"
}
