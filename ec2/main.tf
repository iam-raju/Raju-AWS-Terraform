# to run clone and run 
provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami_value = "ami-053b0d53c279acc90" # replace this
  instance_type_value = "t2.micro"
  subnet_id_value = "subnet-019ea91ed9b5252e7". # replace this
}


# dont clone and run it form your local laptap

provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance" {
  source = "git::https://github.com/iam-raju/raju-terraform.git//ec2/modules/ec2_instance"

  ami_value            = "ami-0f918f7e67a3323f0"           # ✅ Correct AMI ID (Ubuntu 24.04 LTS)
  instance_type_value  = "t2.micro"
  subnet_id_value      = "subnet-056c0a705cd617794"        # ✅ Correct subnet in ap-south-1a
}
