variable "name" {
  description = "The name of the security group"
  type        = string
}

variable "description" {
  description = "The description of the security group"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block(s) that are allowed to access the instance"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "allowed_http_ip_cidr" {
  description = "CIDR block for allowed HTTP IP addresses"
  type        = list(string)
}

variable "allowed_ssh_ip_cidr" {
  description = "CIDR block for allowed SSH IP addresses"
  type        = list(string)
}
