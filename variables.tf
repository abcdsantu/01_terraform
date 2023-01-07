# VPC 
variable "vpc_name" {
  description = "VPC Name"
  type = string 
  default = "santu-vpc"
}

# VPC CIDR 
variable "vpc_cidr_block" {
  description = "VPC CIDR "
  type = string 
  default = "10.0.0.0/16"
}

#  Availability Zones
variable "vpc_availability_zones" {
  description = "VPC Zones"
  type = list(string)
  default = ["us-east-2a", "us-east-2b"]
}

#  Public Subnets
variable "vpc_public_subnets" {
  description = "VPC Public Subnets"
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

#  Private Subnets
variable "vpc_private_subnets" {
  description = "VPC Private Subnets"
  type = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

#  Database Subnets
variable "vpc_database_subnets" {
  description = "VPC  Subnets for DB"
  type = list(string)
  default = ["10.0.5.0/24", "10.0.6.0/24"]
}
#AMI
variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = "ami-0fa49cc9dc8d62c84"
}
#  EC2 Instance Type
variable "instance_type" {
  description = "EC2  Type"
  type = string
  default = "t2.micro"  
}

# AWS EC2 Instance Key Pair to login
variable "instance_keypair" {
  description = "EC2 Key  "
  type = string
  default = "santuppk"
}

# AWS EC2 Private Instance Count
variable "private_instance_count" {
  description = "EC2 Count"
  type = number
  default = 1  
}