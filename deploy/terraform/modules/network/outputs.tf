output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet-private_ids" {
  value = module.vpc.private_subnets
}

output "subnet-private_id_1" {
  value = element(module.vpc.private_subnets, 0)
}

output "subnet-private_id_2" {
  value = element(module.vpc.private_subnets, 1)
}

output "subnet-public_ids" {
  value = module.vpc.public_subnets
}

output "subnet-public_id_1" {
  value = element(module.vpc.public_subnets, 0)
}

output "subnet-public_id_2" {
  value = element(module.vpc.public_subnets, 1)
}

output "sg_ecs_alb_to_ecs" {
  value = aws_security_group.ecs_alb_to_ecs.id
}

output "sg_alb_sg" {
  value = aws_security_group.alb_sg.id
}
