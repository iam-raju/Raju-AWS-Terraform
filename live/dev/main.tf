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

resource "aws_lb_target_group_attachment" "ec2_attach" {
  target_group_arn = module.alb.target_group_arn
  target_id        = module.ec2_instance.instance_id
  port             = 80
}

module "ec2_instance" {
  source            = "git::https://github.com/iam-raju/Raju-AWS-Terraform.git//modules/ec2"

  ami_id            = "ami-020cba7c55df1f615"  # ✅ Use a valid AMI for your region
  instance_type     = "t2.micro"
  subnet_id         = module.vpc.public_subnet_ids[0]
  security_group_id = module.vpc.web_sg_id
  key_name          = "raju"          # ✅ Use a real key pair name
  instance_name     = "raju-ec2"
}
