terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "public_subnet" {
  count                  = length(var.public_subnets)
  vpc_id                 = aws_vpc.main.id
  cidr_block             = var.public_subnets[count.index]
  availability_zone      = var.availability_zones[count.index]
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet" {
  count                  = length(var.private_subnets)
  vpc_id                 = aws_vpc.main.id
  cidr_block             = var.private_subnets[count.index]
  availability_zone      = var.availability_zones[count.index]
  map_public_ip_on_launch = false
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_route_table_association" "public_association" {
  count          = length(var.public_subnets)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_instance" "nginx" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet[0].id
  associate_public_ip_address = true
  key_name               = var.key_name
  security_groups        = [aws_security_group.web_sg.id]

  user_data = <<-EOT
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras enable nginx1
              sudo yum install nginx -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOT

  tags = {
    Name = "Nginx-Instance"
  }
}
