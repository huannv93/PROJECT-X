variable "aws_region" {
  description = "The AWS region things are created in"
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  type = number
}

variable "route53_zone" {
  description = "Route53 zone name"
}

variable "project_name" {
  description = "Name of the project"
}

variable "vpc_name" {
  type        = string
  description = "vpc name of project"
}

variable "vpc_cidr" {
  description = "cidr block for vpc"
  default     = "10.0.0.0/16"
}

########
variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
}

variable "registry_name" {
  description = "The name of the ECR container private registry"
}

variable "app_image_tag" {
  description = "tag version of image registry_name "
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  type        = number
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  type        = number
}

#########
variable "app_count" {
  description = "Number of task on run ecs service"
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

variable "acm_certificate_arn" {
  description = "ARN of ACM SSL certificate"
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


##############
variable "hosted_zone" {
  description = "Name of hosted zone on route53"
}

##############
variable "website_bucket_name" {
  description = "bucket name store frontend code"
}

variable "bucket_log_cf" {
  description = "bucket name store logs cloudfront"
}
variable "acm_certificate_arn_region_root" {
  description = "ARN of ACM SSL certificate in us-east-1 region"
}
variable "Environment" {
  description = "Environment name for tagging"
}
variable "waf_arn" {
  description = "ARN of AWS WAF ID"
}