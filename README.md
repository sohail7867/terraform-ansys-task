# 🚀 Terraform AWS NGINX Deployment
## This project uses Terraform to provision an NGINX server on AWS with a modular infrastructure setup, including: VPC with public and private subnets across availability zones

1. Internet and NAT gateways

2. Route tables

3. IAM roles and instance profile

4. Security group with HTTP and SSH access

5. EC2 instance running NGINX

## 📁 Project Structure
```
.
├── main.tf                  # Main orchestration of modules
├── variables.tf             # Input variables
├── outputs.tf               # Centralized output declarations
├── modules/
│   ├── vpc/
│   ├── subnets/
│   ├── internet-gateway/
│   ├── nat-gateway/
│   ├── route-tables/
│   ├── security-group/
│   ├── iam/
│   └── ec2/
```

## 📦 Modules Overview
## Each module is responsible for a specific infrastructure component:

* VPC Module: Creates a VPC with a CIDR block

* Subnets Module: Sets up public and private subnets across AZs

* Internet Gateway Module: Attaches an IGW to the VPC

* NAT Gateway Module: Creates a NAT Gateway in a public subnet

* Route Tables Module: Sets up public and private routing

* IAM Module: Creates an IAM role and instance profile

* Security Group Module: Opens ports for HTTP and SSH

* EC2 Module: Provisions an NGINX EC2 instance in the public subnet

## ✅ Requirements
* Terraform >= 1.0.0

* AWS CLI configured

* An existing SSH key pair in the selected AWS region

## 🔧 Usage
* Clone this repo:

* git clone https://github.com/your-repo/terraform-aws-nginx.git
* cd terraform-aws-nginx

* Initialize Terraform:
* terraform init
* Customize terraform.tfvars with your values.

* Deploy the infrastructure:

* terraform apply
## 📤 Outputs
* After successful deployment, Terraform will output:

* EC2 public IP

* VPC and subnet IDs

* IGW and NAT IDs

* Security group and route table IDs

## 🧹 Teardown
* To destroy all infrastructure:

* terraform destroy
