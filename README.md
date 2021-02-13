# gloat

Prerequisites:
- kubectl
- awscli
- terraform

1. clone this repo:

git clone --branch master https://github.com/daniel570/gloat.git

2. move to dir, set-up infrastructure using Terraform

cd gloat/k8s/terraform/terraform-aws-eks/

vim variables.tf

* configure 'cluster-name' according to your desired cluster name

terraform init
terraform plan
terraform apply

* wait for infrastructure to come up, may take some time...

3. add user to kubeconfig

aws eks update-kubeconfig --name <cluster-name> --region us-east-1
  
4. install jenkins on eks cluster

cd gloat/k8s/jenkins

kubectl apply -f pv-volume.yaml

kubectl apply -f pv-claim.yaml

kubectl apply -f jenkins-deployment.yaml

5. expose the deployment in order to access it (may be risky, so make sure to configure security for jenkins application to not be accessible to anonymous users)

kubectl expose deployment jenkins --type=LoadBalancer --name=jenkins-external

6. access jenkins application through external URL given in output through port 8080, and configure basic plugins - pipeline, email extension,aws

