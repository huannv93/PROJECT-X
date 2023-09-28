# Network Module
# This module handles networking resources such as VPC, subnets, and security groups.
module "network" {
  source       = "./modules/network"
  aws_region   = var.aws_region
  app_port     = var.app_port
  project_name = var.project_name
  Environment  = var.Environment
  vpc_name     = var.vpc_name
  vpc_cidr     = var.vpc_cidr


}

# x_api_definition Module
# This module defines an definition ecs task with docker image API get from ECR Private for your application.
module "x_api" {
  source                       = "./modules/x_api_definition"
  aws_region                   = var.aws_region
  app_port                     = var.app_port
  ecs_task_execution_role_name = var.ecs_task_execution_role_name
  registry_name                = var.registry_name
  app_image_tag                = var.app_image_tag
  fargate_cpu                  = var.fargate_cpu
  fargate_memory               = var.fargate_memory
  project_name                 = var.project_name
  Environment                  = var.Environment
}

# ECS Module
# This module handles ECS (Elastic Container Service) resources for your application, including LoadBalancing and autoscaling configurations.
module "ecs" {
  source                               = "./modules/ecs"
  aws_region                           = var.aws_region
  app_count                            = var.app_count
  app_port                             = var.app_port
  autoscaling_policy_name              = var.autoscaling_policy_name
  autoscaling_request_per_target_value = var.autoscaling_request_per_target_value
  health_check_path                    = var.health_check_path
  task_definition_arn                  = module.x_api.task_definition_arn
  acm_certificate_arn                  = var.acm_certificate_arn
  subnet_private_1_id                  = module.network.subnet-private_id_1
  subnet_private_2_id                  = module.network.subnet-private_id_2
  subnet_public_1_id                   = module.network.subnet-public_id_1
  subnet_public_2_id                   = module.network.subnet-public_id_2
  alb_sg_id                            = module.network.sg_alb_sg
  sg_id                                = module.network.sg_ecs_alb_to_ecs
  vpc_id                               = module.network.vpc_id
  project_name                         = var.project_name
  Environment                          = var.Environment
  healthy_threshold                    = var.healthy_threshold
  unhealthy_threshold                  = var.unhealthy_threshold
  health_check_timeout                 = var.health_check_timeout
  health_check_interval                = var.health_check_interval
  ecs_max_capacity                     = var.ecs_max_capacity
  ecs_min_capacity                     = var.ecs_min_capacity
  bucket_log                           = var.bucket_log
  depends_on                           = [module.network, module.x_api]
}

# Website Module
# This module is responsible for provisioning resources related to your website, including an S3 bucket and Cloudfront with an ACM certificate for HTTPS.
module "website" {
  source              = "./modules/website"
  aws_region          = var.aws_region
  website_bucket_name = var.website_bucket_name
  acm_certificate_arn = var.acm_certificate_arn_region_root
  bucket_log_cf       = var.bucket_log_cf
  waf_arn             = var.waf_arn
}

# Route53 Module
# This module configures DNS settings using Route 53 for cloudfront and API ALB Endpoint.
module "route53" {
  source              = "./modules/route53"
  hosted_zone         = var.hosted_zone
  alb_dns_name        = module.ecs.alb_endpoint
  alb_zone_id         = module.ecs.alb_zone_id
  cloudfront_dns_name = module.website.cloudfront_dns_name
  cloudfront_zone_id  = module.website.cloudfront_zone_id
  project_name        = var.project_name
  depends_on          = [module.ecs, module.website]
}