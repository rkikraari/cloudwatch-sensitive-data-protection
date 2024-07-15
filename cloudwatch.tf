resource "aws_cloudwatch_log_group" "data_protection_lambda_log_group" {
  name              = "/aws/lambda/${var.data_protection_lambda_name}"
  log_group_class   = "STANDARD"
  retention_in_days = 365
  kms_key_id        = aws_kms_key.cloudwatch_kms_key.id
}

resource "aws_cloudwatch_log_group" "data_protection_audit_log_group" {
  name              = "/aws/${var.data_protection_audit_log_group_name}"
  log_group_class   = "STANDARD"
  retention_in_days = 365
  kms_key_id        = aws_kms_key.cloudwatch_kms_key.id
}

resource "aws_cloudwatch_log_data_protection_policy" "data_protection_cloudwatch_policy" {
  log_group_name = aws_cloudwatch_log_group.data_protection_lambda_log_group.name

  policy_document = jsonencode({
    Name    = "DataPotectionPolicy"
    Version = "2021-06-01"

    Statement = [
      {
        Sid            = "Audit"
        DataIdentifier = ["arn:aws:dataprotection::aws:data-identifier/NhsNumber-GB", "arn:aws:dataprotection::aws:data-identifier/Address"]
        Operation = {
          Audit = {
            FindingsDestination = {
              CloudWatchLogs = {
                LogGroup = aws_cloudwatch_log_group.data_protection_audit_log_group.name
              }
            }
          }
        }
      },
      {
        Sid            = "Redact"
        DataIdentifier = ["arn:aws:dataprotection::aws:data-identifier/NhsNumber-GB", "arn:aws:dataprotection::aws:data-identifier/Address"]
        Operation = {
          Deidentify = {
            MaskConfig = {}
          }
        }
      }
    ]
  })
}
