variable "ami_id" {
  type        = string
  description = "AMI ID to use for EC2"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "EC2 instance type"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID to launch the instance in"
}

variable "security_group_id" {
  type        = string
  description = "Security Group to associate"
}

variable "key_name" {
  type        = string
  description = "SSH key pair name"
}

variable "instance_name" {
  type        = string
  default     = "my-ec2"
  description = "Name tag for the EC2 instance"
}
