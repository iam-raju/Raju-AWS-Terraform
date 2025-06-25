module "s3_raju" {
  source              = "git::https://github.com/iam-raju/Raju-AWS-Terraform.git//modules/s3"
  bucket_name         = "developer-raju-request-s3-bucket"
  acl                 = "private"
  versioning_enabled  = true
  environment         = "dev"
}
