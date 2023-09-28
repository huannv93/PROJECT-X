## Network #
#aws_region   = "ap-southeast-1"
#app_port     = 3000
#route53_zone = "huannguyen.io.vn"
#project_name = "project-x"
#vpc_name     = "vpc-project-x"
#vpc_cidr     = "10.0.0.0/16"
#
## API Task Definition #
#ecs_task_execution_role_name = "ecs-task-role"
#registry_name                = "huannv-repo-private"
#app_image_tag                = "latest"
#fargate_cpu                  = 1024
#fargate_memory               = 2048
#
## ECS #
#app_count                            = "2"
#autoscaling_policy_name              = "autoscaling_policy"
## threshold auto scaling of request on ALB
#autoscaling_request_per_target_value = 100
#health_check_path                    = "/healthz"
#acm_certificate_arn                  = "arn:aws:acm:ap-southeast-1:221008696644:certificate/60b6f73b-5113-4212-a9f4-84bd910f2a33"
##number healthy check
#healthy_threshold                    = 3
#unhealthy_threshold                  = 3
#health_check_timeout                 = 5
#health_check_interval                = 60
##number scaling
#ecs_min_capacity                     = 1
#ecs_max_capacity                     = 5
#bucket_log                           = "alb-logs-api-testing-1"
#
## Route53 #
#hosted_zone = "huannguyen.io.vn"
#
## Website
#website_bucket_name             = "huannguyen.io.vn"
#website_domain_name             = "huannguyen.io.vn"
#acm_certificate_arn_region_root = "arn:aws:acm:us-east-1:221008696644:certificate/cc87c26c-21ab-4171-8707-9f97d8a39727"
#waf_arn                         = "arn:aws:wafv2:us-east-1:221008696644:global/webacl/demo-waf-cf/4b94619c-869c-47da-a431-a94706a53f02"
#bucket_log_cf                   = "cf-huannv-log"
#
#Environment = "Dev-Env"


