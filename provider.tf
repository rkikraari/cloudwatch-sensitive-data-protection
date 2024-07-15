provider "aws" {

  region                   = var.region
  profile                  = "aws-learn"
  shared_config_files      = ["/Users/rajiv.iyer/.aws/config"]
  shared_credentials_files = ["/Users/rajiv.iyer/.aws/credentials"]
  default_tags {
    tags = {
      "Name"        = "CWDP"
      "Description" = "CloudWatch Data Protection Capability"
      "Environment" = "Dev"
      "Owner"       = "Platform Team"
    }
  }
}
