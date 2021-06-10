Amazon EKS using Terraform

# Amazon CLI
We can get the Amazon CLI on Docker-Hub
We'll need the Amazon CLI to gather information so we can build our Terraform file.

## Run Amazon CLI container by mounting all terraform files folder into container working directory 'work'
docker run -it --rm -v ${PWD}:/work -w /work --entrypoint /bin/sh amazon/aws-cli:2.0.43

## Then download some some handy tools 
yum install -y jq gzip nano tar git unzip wget

# Configure Amazon CLI to get authenticated with aws

*aws configure*

AWS Access Key ID: XXXXX

AWS Secret Access Key: XXXXX

Default region name: eu-west-2

Default output format: json


# Download and install terraform Terraform CLI

curl -o /tmp/terraform.zip -LO https://releases.hashicorp.com/terraform/0.15.5/terraform_0.15.5_linux_amd64.zip
unzip /tmp/terraform.zip
chmod +x terraform && mv terraform /usr/local/bin/
terraform

# plugins

terraform init
# plan and apply
terraform plan
terraform apply

# Lets see the example deployment we deployed
1st grab EKS config using cli

aws eks update-kubeconfig --name isak-eks-xxxxx --region eu-west-2

# Get kubectl

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl

kubectl get nodes

kubectl get deploy

kubectl get pods

kubectl get svc


# Clean up
terraform destroy