module "vpc" {
  source     = "git::https://github.com/iam-raju/Raju-AWS-Terraform.git//modules/vpc"

  cidr_block = "10.0.0.0/16"    # must match variable "cidr_block"
  vpc_name   = "raju-vpc"      # optional, defaults to "my-vpc" if you omit
}

module "alb" {
  source = "git::https://github.com/iam-raju/Raju-AWS-Terraform.git//modules/alb"

  lb_name           = "raju-alb"
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = module.vpc.public_subnet_ids
  security_group_id = module.vpc.web_sg_id
  target_group_name = "raju-tg"
}
