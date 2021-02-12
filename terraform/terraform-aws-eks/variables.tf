# Variables Configuration

variable "cluster-name" {
  default     = "danielh-eks-cluster"
  type        = string
  description = "The name of your EKS Cluster"
}

variable "aws-region" {
  default     = "us-east-1"
  type        = string
  description = "The AWS Region to deploy EKS"
}

variable "availability-zones" {
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  type        = list
  description = "The AWS AZ to deploy EKS"
}

variable "k8s-version" {
  default     = "1.18"
  type        = string
  description = "Required K8s version"
}

variable "kublet-extra-args" {
  default     = ""
  type        = string
  description = "Additional arguments to supply to the node kubelet process"
}

variable "public-kublet-extra-args" {
  default     = ""
  type        = string
  description = "Additional arguments to supply to the public node kubelet process"

}

variable "vpc-subnet-cidr" {
  default     = "10.0.0.0/16"
  type        = string
  description = "The VPC Subnet CIDR"
}

variable "private-subnet-cidr" {
  default     = ["10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/19"]
  type        = list
  description = "Private Subnet CIDR"
}

variable "public-subnet-cidr" {
  default     = ["10.0.128.0/20", "10.0.144.0/20", "10.0.160.0/20"]
  type        = list
  description = "Public Subnet CIDR"
}

variable "db-subnet-cidr" {
  default     = ["10.0.192.0/21", "10.0.200.0/21", "10.0.208.0/21"]
  type        = list
  description = "DB/Spare Subnet CIDR"
}

variable "eks-cw-logging" {
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  type        = list
  description = "Enable EKS CWL for EKS components"
}

variable "node-instance-type" {
  default     = "t2.xlarge"
  type        = string
  description = "Worker Node EC2 instance type"
}

variable "root-block-size" {
  default     = "20"
  type        = string
  description = "Size of the root EBS block device"

}

variable "desired-capacity" {
  default     = 2
  type        = string
  description = "Autoscaling Desired node capacity"
}

variable "max-size" {
  default     = 5
  type        = string
  description = "Autoscaling maximum node capacity"
}

variable "min-size" {
  default     = 1
  type        = string
  description = "Autoscaling Minimum node capacity"
}

variable "ec2-key-public-key" {
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCv2ZSI7uwh9aFAQa++B8WOmjwLtwKHlqTYwsrQRaHS9wxWXqUssXFMalRrfhvtXSi5D/OYSWOUElpbvD+wYixzqTvvxDlrCB+VGLBaZIAwKOdmhyvYXONtf64CEIwyfzfqH3lE+j8OCNSxsxxjvQyY0FuhFlCDL7sRT/ZvPtuIDlW+CteCzU+S3EBd7lrnaBzPhLUjlEdY4rGDQK1SX50y4MuPJ549MjRHJaDKoN5nTkKea6x0zlyJIGdowa8nCOHE+AwdHpWxHFANx1cLbug65eAvxK8nIjmV8a9ymk4oNIGzrJPAubpkhJ+VVCsBBBMtBrGtt+hiYzIhW2UZVqr/"
  type        = string
  description = "AWS EC2 public key data"
}
