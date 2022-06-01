#  EC2 - Bastion

module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  
 
  name                   = "single-instanc"
  #ami = "ami-0fa49cc9dc8d62c84"
  ami = var.ami
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.public_bastion_sg.security_group_id]
  
}
