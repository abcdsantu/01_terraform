# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  
  
  name = "${var.vpc_name}"
  cidr = var.vpc_cidr_block
  azs             = var.vpc_availability_zones
  public_subnets  = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets  

  # Database Subnets
  database_subnets = var.vpc_database_subnets
  
  

# Tags for Subnets
  public_subnet_tags = {
    Type = "Public Subnets"
  }
  private_subnet_tags = {
    Type = "Private Subnets"
  }  
  database_subnet_tags = {
    Type = "Private Database Subnets"
  }
}

##Outputs
# VPC ID
output "vpc_id" {
  description = " VPC_ID"
  value       = module.vpc.vpc_id
}

# VPC CIDR blocks
output "vpc_cidr_block" {
  description = "The CIDR for VPC"
  value       = module.vpc.vpc_cidr_block
}

# VPC Private Subnets
output "private_subnets" {
  description = " private subnets"
  value       = module.vpc.private_subnets
}

# VPC Public Subnets
output "public_subnets" {
  description = " public subnets"
  value       = module.vpc.public_subnets
}

module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  
  name = "public-bastion-host"
  description = "port for ssh"
  vpc_id = module.vpc.vpc_id
  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules = ["all-all"]
  
}

## ec2_bastion_public_instance_ids
output "ec2_bastion_public_instance_ids" {
  description = " instances"
  value       = module.ec2_public.id
}

## ec2_publicIP
output "ec2_bastion_public_ip" {
  description = "public IP address"
  value       = module.ec2_public.public_ip 
}