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

7. copy kubeconfig to jenkins node to be able to perform cluster actions through jenkins

kubectl get all
* make note of jenkins pod name

kubectl cp ~/.kube/ default/<jenkins-pod>:/var/jenkins_home/.kube/ 
  
8. log in to a cluster node which is used as jenkins slave, and configure

kubectl exec -it pod/<jenkins-pod> -- /bin/bash
  
* install kubectl
curl -LO https://dl.k8s.io/release/v1.20.0/bin/linux/amd64/kubectl

install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

* install awscli, configure according to your user credentials
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

unzip awscliv2.zip

./aws/install

aws configure

9. grant jenkins-slave permissions to perform cluster operations from jobs

kubectl create clusterrolebinding ops-user-cluster-admin-binding-system --clusterrole=cluster-admin --user=system:serviceaccount:default:default

10. create jenkins pipeline job, copy contents from gloat/k8s/jenkins/Jenkinsfile into 'pipeline script definition' section of the job configuration 
