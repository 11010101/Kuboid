# root variables

variable "app_name" {
  description = "name of the app for component naming"
  default = "kuboid"
}

variable "region" {
  description = "gcp region"
  default = ""
}

variable "vpc_cidr_block" {
  description = "cidr block for the vpc"
  default = "192.168.0.0/20"
}
