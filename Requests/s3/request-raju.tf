module "s3_ram" {
  source              = "../../modules/s3"
  bucket_name         = "dev-ram-reports-bucket"
  acl                 = "private"
  versioning_enabled  = true
  environment         = "dev"
}
