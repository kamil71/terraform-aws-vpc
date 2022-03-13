# Deploying VPC+ASG+ALB via Terraform on AWS

Configuration in this directory creates several different variations of resources for VPC, Autoscaling Group, Application Load Balancer.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72 |

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan 
$ terraform apply

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.


## Resources

| Name | Type |
|------|------|
| [aws_iam_instance_profile.ssm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.ssm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_service_linked_role.autoscaling](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_service_linked_role) | resource |
| [aws_launch_template.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_ami.amazon_linux](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |



## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_complete_autoscaling_group_arn"></a> [complete\_autoscaling\_group\_arn](#output\_complete\_autoscaling\_group\_arn) | The ARN for this AutoScaling Group |
| <a name="output_complete_autoscaling_group_availability_zones"></a> [complete\_autoscaling\_group\_availability\_zones](#output\_complete\_autoscaling\_group\_availability\_zones) | The availability zones of the autoscale group |