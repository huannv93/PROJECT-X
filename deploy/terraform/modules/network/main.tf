locals {
  azs = slice(data.aws_availability_zones.available.names, 0, 3)
}

locals {
  tags = {
    Environment = var.Environment
    Application = var.project_name
  }
}
data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 4.0"
  name    = var.vpc_name
  cidr    = var.vpc_cidr

  azs             = local.azs
  private_subnets = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 4, k) if k < 2]
  public_subnets  = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k + 48) if k < 2]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = local.tags

  private_subnet_tags = local.tags
}


resource "aws_security_group" "alb_sg" {
  name        = "alb-${var.project_name}"
  description = "Allows TCP traffic on app port"
  vpc_id      = module.vpc.vpc_id
  tags        = local.tags

  ingress {
    description = "Allows TCP traffic on https port "
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allows TCP traffic on http port "
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "ecs_alb_to_ecs" {
  vpc_id = module.vpc.vpc_id
  name   = "allow-ecs-alb-to-ecs"
  tags   = local.tags

  ingress {
    from_port       = var.app_port
    to_port         = var.app_port
    protocol        = "tcp"
    security_groups = [
      aws_security_group.alb_sg.id
    ]
    description = "Allow access app port  from alb"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
