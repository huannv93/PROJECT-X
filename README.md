# Project X
Infrastructure to deploy a containerized API using ECS Fargate with service autoscaling and an Application Load Balancer. Frontend deployment uses S3 static web hosting setup with a cloudfront distribution.
The infrastructure as code is written using Terraform.

## Architecture:
The infrastructure is composed of the following ressources:
* Backend infrastructure: Contains an ECR registry, a task definition, an ECS cluster, an ECS service associated with a target group and an Application Load Balancer, an SSL certificate and a backend A record pointing to the load balancer. The ECS service is configured with a service autoscaling (Target Tracking Autoscaling which scales based on the ALB's requests per target).
*  Frontend infrastructure: Contains of Frontend is stored in S3 bucket private, alongside a cloudfront distribution, an SSL certificate and a website A record in Route53...


![alt text](https://github.com/huannv93/PROJECT-X/blob/main/deploy/docs/diagram.png)


### Initialization

Working directory : 
```bash
cd deploy/terraform
```

Initialize your Terraform workspace and download the necessary provider plugins:

```bash
terraform init
```

### Deploy

Apply the Terraform configuration to create the infrastructure:

```bash
terraform apply
```
Optionally with set variable values 
```bash
terraform apply -var-file=./enviroments/x/y.tfvars
```



Review the changes, and if they look correct, type `yes` to confirm.

## Terraform Files

- `main.tf`: Defines the infratructure and other necessary resources. include 05 mudules (Networking, ECS, API Definition, Website, Route53)
- `variables.tf`: Contains variable definitions for customization.
- `outputs.tf`: Defines output variables that can be useful for retrieving information about the deployed infrastructure.
- `terraform.tfvars`: Optionally, you can create this file to set variable values without modifying the code. 
- `enviroments`: Optionally, you can create tfvars file each enviroments to set variable values without modifying the code.
- `backend.tf`: The backend determines where and how Terraform stores its state file, which is essential for tracking the state of your infrastructure and managing changes.

## Using Terraform Cloud as the Backend Provider

If you want to use Terraform Cloud as the backend provider for managing your infrastructure remotely, follow these steps:

1. Set up a Terraform Cloud account if you haven't already: [Terraform Cloud](https://app.terraform.io/signup/account).

2. Configure your Terraform code to use Terraform Cloud as the backend provider by adding the following to your `backend.tf`:

```hcl
terraform {
  required_version = ">= 0.14"
  backend "remote" {
    organization = "your-organization-name"  # Replace with your Terraform Cloud organization name
    workspaces {
      name = "your-workspace-name"  # Replace with the name of your workspace in Terraform Cloud
    }
  }
}
```

3. Log in to your Terraform Cloud account.

4. Create a new workspace or use an existing one, matching the workspace name specified in your `backend.tf`.

5. Configure the workspace settings, including variables and version control settings.

6. Trigger a run in Terraform Cloud to apply your configuration remotely.

## Troubleshooting

If you encounter issues or have questions, please refer to the [Terraform documentation](https://www.terraform.io/docs/index.html) or search for solutions in the [Terraform community](https://community.hashicorp.com/c/terraform/13).

## Contributing

Contributions are welcome! If you find any bugs, have feature requests, or want to improve the code, please open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use and modify it according to your needs.

---