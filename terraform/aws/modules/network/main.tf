# aws network main

resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
      Name = "${var.app_name}-vpc"
      ManagedBy = "Terraform"
    }
}

##
# subnets
##
resource "aws_subnet" "public" {
  count = length(var.public_subnets)

  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnets[count.index]
  # loop back around to start of availability zones list
  availability_zone = var.availability_zones[count.index % length(var.availability_zones)]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.app_name}-${var.availability_zones[count.index]}-public-subnet-${count.index + 1}"
    ManagedBy = "Terraform"
  }
}
resource "aws_subnet" "private" {
  count = length(var.private_subnets)

  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnets[count.index]
  # loop back around to start of availability zones list
  availability_zone = var.availability_zones[count.index % length(var.availability_zones)]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.app_name}-${var.availability_zones[count.index]}-private-subnet-${count.index + 1}"
    ManagedBy = "Terraform"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.app_name}-igw"
    ManagedBy = "Terraform"
  }
}

##
# public route table
##
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.app_name}-route-table"
    ManagedBy = "Terraform"
  }
}
resource "aws_route_table_association" "name" {
  count = length(var.public_subnets)

  subnet_id = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}
resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}