variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnets" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID to use for EC2 instances"
  type        = string
  default     = "ami-00a929b66ed6e0de6" # Amazon Linux 2 AMI for us-east-1
}

variable "key_name" {
  description = "Name of the EC2 key pair"
  type        = string
  default     = "teraform-aws-nginx"
}

variable "availability_zones" {
  description = "List of availability zones for subnet creation"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}