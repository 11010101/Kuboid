# network variables

variable "vpc_name" {
  description = "Name of VPC, used in: naming vpc components"
  type = string
}

variable "availability_zones" {
  description = "list of aws availability zones, created for: assigning availability zones to subnets"
  type = list(string)
}

variable "public_subnets" {
  description = "list of cidr blocks for public subnets, used in: assigning cidr block to public subnets"
  type = list(string)
}

variable "private_subnets" {
  description = "list of cidr blocks for private subnets, used in: assigning cidr block to private subnets"
  type = list(string)
}

variable "vpc_cidr" {
  description = "Cidr block of vpc, created for: assigning to vpc"
}
