output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets."
  value       = module.subnets.public_subnet_ids
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets."
  value       = module.subnets.private_subnet_ids
}

output "internet_gateway_id" {
  description = "The ID of the internet gateway."
  value       = module.internet_gateway.igw_id
}

output "nat_gateway_id" {
  description = "The ID of the NAT gateway."
  value       = module.nat_gateway.nat_id
}

output "public_ip" {
  description = "The public IP of the EC2 instance."
  value       = module.ec2.public_ip
}
