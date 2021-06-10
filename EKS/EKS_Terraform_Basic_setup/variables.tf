variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "cluster_name" {
  type    = string
  default = "ISAK-EKS"
}

variable "k8s_version" {
  type = string
  default = "1.20"
}

variable "release_version" {
  type    = string
  default="1.20.4-20210526"
}

variable "min_node_count" {
  type    = number
  default = 3
}

variable "max_node_count" {
  type    = number
  default = 5
}

variable "machine_type" {
  type    = string
  default = "t2.micro"
}

