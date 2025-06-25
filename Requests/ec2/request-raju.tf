module "ec2_raju" {
  source            = "git::https://github.com/iam-raju/Raju-AWS-Terraform.git//modules/ec2"

  ami_id            = "ami-0a7d80731ae1b2435"       # ✅ Amazon Linux 2 AMI (update if needed)
  instance_type     = "t2.micro"                   # ✅ Optional (has default) — good to keep
  subnet_id         = "subnet-002b390b6ec8cbfe1"    # ❗ Replace with a default subnet ID
  security_group_id = "sg-06e73db474db7ac79"        # ❗ Replace with your default SG ID
  key_name          = "raju"                        # ✅ Your manually created key pair
  instance_name     = "ec2-raju"                    # ✅ Shows in EC2 console Name tag
}

