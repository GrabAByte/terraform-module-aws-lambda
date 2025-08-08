<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.11 |
| <a name="requirement_archive"></a> [archive](#requirement\_archive) | ~> 2.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | 2.7.1 |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.99.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.lambda_log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_role.lambda_exec_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.lambda_s3_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.lambda_logging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.vpc_exec](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_permission.auth_api_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [archive_file.lambda](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_arn"></a> [bucket\_arn](#input\_bucket\_arn) | The S3 bucket ARN to upload to | `string` | n/a | yes |
| <a name="input_enable_logging"></a> [enable\_logging](#input\_enable\_logging) | Whether to send logs to Cloudwatch | `bool` | `true` | no |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | The Lambda function name | `string` | n/a | yes |
| <a name="input_handler"></a> [handler](#input\_handler) | The lambda handler | `string` | n/a | yes |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | The name of the IAM Role to assign the policy to | `string` | n/a | yes |
| <a name="input_integration_destination"></a> [integration\_destination](#input\_integration\_destination) | The destination integration | `string` | n/a | yes |
| <a name="input_integration_source"></a> [integration\_source](#input\_integration\_source) | The sourcing integration | `string` | n/a | yes |
| <a name="input_lambda_filename"></a> [lambda\_filename](#input\_lambda\_filename) | The lambda filename | `string` | `"lambda_function.zip"` | no |
| <a name="input_lambda_source"></a> [lambda\_source](#input\_lambda\_source) | The source file for the lambda function | `string` | n/a | yes |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | The lambda runtime | `string` | n/a | yes |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | The security group(s) to attach the lambda to | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The project tags | `map(any)` | n/a | yes |
| <a name="input_vpc_subnet_0"></a> [vpc\_subnet\_0](#input\_vpc\_subnet\_0) | The VPC subnet(s) to deploy the lambda into | `string` | n/a | yes |
| <a name="input_vpc_subnet_1"></a> [vpc\_subnet\_1](#input\_vpc\_subnet\_1) | The VPC subnet(s) to deploy the lambda into | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_invoke_arn"></a> [invoke\_arn](#output\_invoke\_arn) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
<!-- END_TF_DOCS -->