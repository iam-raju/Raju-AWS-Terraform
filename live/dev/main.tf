module "vpc" {
  source     = "git::https://github.com/iam-raju/Raju-AWS-Terraform.git//modules/vpc"

  cidr_block = "10.0.0.0/16"    # must match variable "cidr_block"
  vpc_name   = "raju-vpc"      # optional, defaults to "my-vpc" if you omit
}

module "alb" {
  source = "../../modules/alb"

  lb_name           = "raju-alb"
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = module.vpc.public_subnet_ids
  security_group_id = module.vpc.web_sg_id
  target_group_name = "raju-tg"
}

module "ec2" {
  source = "../../ec2/modules/ec2_instance"

  instance_name       = "raju-web"
  ami_id              = "ami-0261755bbcb8c4a84"
  instance_type       = "t2.micro"
  subnet_id           = module.vpc.public_subnet_ids[0]
  security_group_id   = module.vpc.web_sg_id
  user_data_file_path = "${path.module}/userdata.sh"
}
