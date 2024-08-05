# cloudwatch-sensitive-data-protection

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.9.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.58.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.58.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lambda"></a> [lambda](#module\_lambda) | git::https://github.com/terraform-aws-modules/terraform-aws-lambda.git | b88a856 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_data_protection_policy.data_protection_cloudwatch_policy](https://registry.terraform.io/providers/hashicorp/aws/5.58.0/docs/resources/cloudwatch_log_data_protection_policy) | resource |
| [aws_cloudwatch_log_group.data_protection_audit_log_group](https://registry.terraform.io/providers/hashicorp/aws/5.58.0/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.data_protection_lambda_log_group](https://registry.terraform.io/providers/hashicorp/aws/5.58.0/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_role.lambda_data_protection_role](https://registry.terraform.io/providers/hashicorp/aws/5.58.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.attach_cloudwatch_policy_to_role](https://registry.terraform.io/providers/hashicorp/aws/5.58.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kms_key.cloudwatch_kms_key](https://registry.terraform.io/providers/hashicorp/aws/5.58.0/docs/resources/kms_key) | resource |
| [aws_kms_key_policy.cloudwatch_kms_key_policy](https://registry.terraform.io/providers/hashicorp/aws/5.58.0/docs/resources/kms_key_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/5.58.0/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy.cloudwatch_policy](https://registry.terraform.io/providers/hashicorp/aws/5.58.0/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy_document.lambda_assume_data_protection_policy](https://registry.terraform.io/providers/hashicorp/aws/5.58.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data_protection_audit_log_group_name"></a> [data\_protection\_audit\_log\_group\_name](#input\_data\_protection\_audit\_log\_group\_name) | The name of the CloudWatch Log Group for Audit report | `string` | `"DataProtectionAuditReportLogGroup"` | no |
| <a name="input_data_protection_lambda_name"></a> [data\_protection\_lambda\_name](#input\_data\_protection\_lambda\_name) | The name of the CloudWatch Data Protection Testing Lambda | `string` | `"CloudWatchDataProtectionTestFunction"` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region where the services would be deployed | `string` | `"eu-west-2"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
