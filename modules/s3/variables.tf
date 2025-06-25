variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket to create"
}

variable "acl" {
  type        = string
  default     = "private"
  description = "Canned ACL to apply (e.g., private, public-read)"
}

variable "versioning_enabled" {
  type        = bool
  default     = false
  description = "Enable versioning on the bucket"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Tag to identify environment (e.g., dev, prod)"
}

