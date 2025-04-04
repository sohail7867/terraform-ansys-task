variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "security_group_ids" {
  description = "List of security group IDs to assign to the EC2 instance"
  type        = list(string)
}

variable "iam_instance_profile" {
  type        = string
  description = "IAM instance profile to attach to the EC2 instance"
  default     = null
}
