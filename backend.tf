terraform {
  backend "s3" {
    bucket  = "terraform632541"
    key     = "terraform/terraform"
    region  = "ap-south-1"
    encrypt = true
    use_lockfile = true
  }
}


