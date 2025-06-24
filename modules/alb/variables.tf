variable "lb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
  default     = "my-alb"
}

variable "subnet_ids" {
  description = "List of public subnet IDs for ALB"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where the ALB and target group will be created"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID to associate with the ALB"
  type        = string
}

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
  default     = "my-target-group"
}
