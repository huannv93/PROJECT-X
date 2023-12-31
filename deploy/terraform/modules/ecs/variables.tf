variable "app_count" {
  description = "Number of task on run ecs service"
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
}

variable "autoscaling_policy_name" {
  description = "Name of the service autoscaling policy"
}

variable "autoscaling_request_per_target_value" {
  description = "The service autoscaling target requests per container"
}

variable "health_check_path" {
  description = "The backend path for health checks"
}

variable "aws_region" {
  description = "The AWS region things are created in"
}

variable "task_definition_arn" {
  description = "ARN of the created task definition"
}

variable "acm_certificate_arn" {
  description = "ARN of backend's SSL certificate"
}

variable "subnet_private_1_id" {
  description = "Id of subnet private 1"
}

variable "subnet_private_2_id" {
  description = "Id of subnet private 2"
}

variable "subnet_public_1_id" {
  description = "Id of subnet public 1"
}

variable "subnet_public_2_id" {
  description = "Id of subnet public 2"
}

variable "alb_sg_id" {
  description = "Id of the ALB's security group"
}

variable "sg_id" {
  description = "Id of the ECS service's security group"
}

variable "vpc_id" {
  description = "Id of the used VPC"
}

variable "project_name" {
  description = "Name of the project"
}

variable "healthy_threshold" {
  description = "Healthy Threshold"
}

variable "unhealthy_threshold" {
  description = "Unhealthy Threshold"
}

variable "health_check_interval" {
  description = "Health check interval"
}

variable "health_check_timeout" {
  description = "Health check timeout"
}

variable "ecs_max_capacity" {
  description = "ECS maximum capacity"
}

variable "ecs_min_capacity" {
  description = "ECS minimum capacity"
}

variable "bucket_log" {
  description = "bucket name where store logs of ALB"
}
variable "Environment" {}
