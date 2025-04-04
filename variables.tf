variable "region" {
  description = "The AWS region to create resources in."
  type        = string
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
  default     = "my-vpc"
}

variable "azs" {
  description = "List of availability zones to be used for subnets."
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for the public subnets."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for the private subnets."
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "instance_type" {
  description = "The EC2 instance type to provision."
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the SSH key pair to use for EC2 instances."
  type        = string
  default     = "teraform-aws-nginx"
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance."
  type        = string
  default     = "ami-087f352c165340ea1"
}

variable "instance_name" {
  description = "The name tag for the EC2 instance."
  type        = string
  default     = "nginx-instance"
}

variable "allowed_http_ip_cidr" {
  description = "CIDR block for allowed HTTP IP addresses"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allowed_ssh_ip_cidr" {
  description = "CIDR block for allowed SSH IP addresses"
  type        = list(string)
  default     = ["80.5.85.5/32"]
}
