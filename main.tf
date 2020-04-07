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