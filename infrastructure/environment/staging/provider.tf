terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.74.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.27.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "dev-OU"
}


provider "kubernetes" {
  config_path    = "~./kube/config"
  config_context = "arn:aws:eks:us-east-1:794824174386:cluster/drone-cluster"

}

provider "helm" {
  kubernetes {
    config_path    = "~./kube/config"
    config_context = "arn:aws:eks:us-east-1:794824174386:cluster/drone-cluster"
  }

}