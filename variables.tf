variable "region" {
  default     = "eu-west-2"
  description = "The AWS region where the services would be deployed"
  type        = string
}

variable "data_protection_lambda_name" {
  description = "The name of the CloudWatch Data Protection Testing Lambda"
  type        = string
  default     = "CloudWatchDataProtectionTestFunction"
}

variable "data_protection_audit_log_group_name" {
  description = "The name of the CloudWatch Log Group for Audit report"
  type        = string
  default     = "DataProtectionAuditReportLogGroup"
}

