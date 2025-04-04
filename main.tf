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

module "vpc" {
  source     = "./modules/vpc"
  vpc_cidr   = var.vpc_cidr
  vpc_name   = var.vpc_name
}

module "subnets" {
  source               = "./modules/subnets"
  vpc_id               = module.vpc.vpc_id
  azs                  = var.azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "internet_gateway" {
  source = "./modules/internet-gateway"
  vpc_id = module.vpc.vpc_id
}

module "nat_gateway" {
  source        = "./modules/nat-gateway"
  public_subnet = module.subnets.public_subnet_ids[0]
  az            = var.azs[0]
}

module "route_tables" {
  source             = "./modules/route-tables"
  vpc_id             = module.vpc.vpc_id
  igw_id             = module.internet_gateway.igw_id
  nat_gateway_id     = module.nat_gateway.nat_id
  public_subnet_ids  = module.subnets.public_subnet_ids
  private_subnet_ids = module.subnets.private_subnet_ids
}

module "ec2" {
  source           = "./modules/ec2"
  public_subnet_id = module.subnets.public_subnet_ids[0]
  instance_type    = var.instance_type
  key_name         = var.key_name
  ami_id           = var.ami_id
  instance_name    = var.instance_name
  security_group_ids = [module.security_group.security_group_id]
  iam_instance_profile = module.iam.instance_profile_name
}

module "security_group" {
  source      = "./modules/security-group"
  name        = "web-sg"
  description = "Allow HTTP and SSH access"
  vpc_id      = module.vpc.vpc_id  # Assuming the VPC is created in the VPC module
  allowed_http_ip_cidr = ["0.0.0.0/0"]  # Pass as list here
  allowed_ssh_ip_cidr  = ["80.5.85.5/32"]  # Pass as list here
}

module "iam" {
  source                = "./modules/iam"
  role_name             = "ec2-role"
  instance_profile_name = "ec2-instance-profile" 
}
