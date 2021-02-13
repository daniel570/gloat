# gloat

Prerequisites:
- kubectl
- awscli
- terraform

1. clone this repo:

git clone --branch master https://github.com/daniel570/gloat.git

2. move to dir, set-up infrastructure using Terraform

cd gloat/k8s/terraform/terraform-aws-eks/

terraform init
terraform plan
terraform apply
