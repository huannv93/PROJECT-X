variable "aws_region" {
  description = "The AWS region things are created in"
}

variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
}

variable "registry_name" {
  description = "The name of the ECR container registry"
}

variable "app_image_tag" {
  description = "tag version of image registry_name "
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  type        = number
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  type        = number
}

variable "project_name" {
  description = "Name of the project"
}

variable "Environment" {}