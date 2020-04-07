# Terraform Cloud Remote Execution
# Create Organization
# Create New Workspace and Integration with VCS
terraform {
    backend "remote" {
        organization = "photonix"
    }
}

resource "null_resource" "local_run" {
    provisioner "local-exec" {
        command = "ls -l; whoami; uname -a; sleep 10"
    }
}

provider "aws" {
  profile = "default"
  region  = "ap-southeast-1"
}

resource "aws_s3_bucket" "covid19webhook" {
  bucket = "covid19webhook"
  acl    = "private"

  tags = {
    Name        = "covid19"
    Environment = "Dev"
  }
}