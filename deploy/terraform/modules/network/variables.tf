variable "aws_region" {
  description = "The AWS region things are created in"
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
}

variable "project_name" {
  description = "Name of the project"
}

variable "vpc_name" {
  description = "Name of VPC"
  type = string
}
variable "Environment" {}

variable "vpc_cidr" {
  description = "cidr block for vpc"
}