# EKS cluster setup using eksctl

## 'ekctl' is a CLI tool which automates the provisioning of EKS on AWS
eksctl is a simple command line utility for creating and managing Kubernetes clusters on Amazon EKS. Using eksctl we will create several resources automatically that we have to create manually using the AWS Management Console. Behind the scenes it uses cloudformation, one stack for cluster itself (VPC, IAM roles, etc) and other stack for managed nodegroup.

## Pre-requisites
* kubectl – A command line tool for working with Kubernetes clusters.
* eksctl – A command line tool for working with EKS clusters that automates many individual tasks. 
* Required IAM permissions – The IAM security principal that you're using must have permissions to work with Amazon EKS IAM roles and service linked roles, AWS CloudFormation, and a VPC and related resource



## We will run docker conatiner of amazoncli
docker run -it --rm -v ${PWD}:/work -w /work --entrypoint /bin/sh amazon/aws-cli:2.0.43

## Then download some handy tools 
yum install -y jq gzip nano tar git unzip wget bind-utils

## Configure Amazon CLI to get authenticated with aws

*aws configure*

AWS Access Key ID: *XXXXX*

AWS Secret Access Key: *XXXXX*

Default region name: *eu-west-2*

Default output format: *json*

## Download and install ekctl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp

sudo mv /tmp/eksctl /usr/local/bin

eksctl version

## Download and install Kubectl

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

chmod +x ./kubectl

mv ./kubectl /usr/local/bin/kubectl

## generate key-pair 

aws ec2 create-key-pair --region eu-west-2 --key-name isak-eks-key

## Run eksctl command

eksctl create cluster \
  --name isak-eks-cluster \
  --version 1.20 \
  --region eu-west-2 \
  --nodegroup-name Linux-Nodes \
  --nodes 3 \
  --nodes-min 1 \
  --nodes-max 4 \
  --node-type t3.micro \
  --node-volume-size 8 \
  --ssh-access \
  --ssh-public-key isak-eks-key \
  --managed



## Delete your cluster and nodes

eksctl delete cluster --name isak-eks-cluster --region eu-west-2