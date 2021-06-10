# Kubernetes cluster setup using Kops

## kops is an automated provisioning system:
* Fully automated installation
* Uses DNS to identify clusters
* Self-healing: everything runs in Auto-Scaling Groups
* Multiple OS support (Debian, Ubuntu 16.04 supported, CentOS & RHEL, Amazon Linux and CoreOS)
* High-Availability support
* Can directly provision, or generate terraform manifests 

## * Pre-requisites
* You must install kubectl.
* You must install kops on a 64-bit (AMD64 and Intel 64) device architecture.
* You must have an AWS account, generate IAM keys and configure them. The IAM user will need adequate permissions



## * We will run docker conatiner of amazoncli
docker run -it --rm -v ${PWD}:/work -w /work --entrypoint /bin/sh amazon/aws-cli:2.0.43

## * Then download some some handy tools 
yum install -y jq gzip nano tar git unzip wget bind-utils

## * Configure Amazon CLI to get authenticated with aws

aws configure
AWS Access Key ID: XXXXX
AWS Secret Access Key: XXXXX
Default region name: eu-west-2
Default output format: json

## * Download and install Kops
curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops-linux-amd64
mv kops-linux-amd64 /usr/local/bin/kops

## * Download and install Kubectl

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl

## * We will host a subdomain in Route53 for our main domain in GoDaddy. To host a subdoamin we need to create a hosted zone in Route53. We will create a public hosted zone, Once you create a subdomain like 'k8s.isakmohammed.co.uk' in  Route53, it will give you 4x NS records urls. We need to add this urls as NS records in our main domain provider dns settings so that our subdomain points to Route53 hosted zone. 

## * Create an S3 bucket to store your clusters state


## * Build your cluster configuration
kops create cluster --name=k8s.isakmohammed.co.uk --state=s3://kops-isak --zones=eu-west-2a,eu-west-2b,eu-west-2c --node-count=3 --node-size=t2.micro --master-size=t2.micro --dns-zone=k8s.isakmohammed.co.uk

## * Create the cluster in AWS
kops update cluster --name k8s.isakmohammed.co.uk --state=s3://kops-isak --yes --admin

## * you can chcke the status of cluster when its ready by using
kops validate cluster --state=s3://kops-isak

## * To delete the cluster
kops delete cluster  --name=k8s.isakmohammed.co.uk --state=s3://kops-isak --yes

## * once cluster is deleted ensure you delete public hosted zone in Route53 otherwise some charges might incur
