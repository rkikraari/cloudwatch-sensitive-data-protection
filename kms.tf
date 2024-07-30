resource "aws_kms_key" "cloudwatch_kms_key" {
  description             = "A symmetric encryption KMS key for CloudWatch"
  enable_key_rotation     = true
  deletion_window_in_days = 7
}

data "aws_caller_identity" "current" {}


resource "aws_kms_key_policy" "cloudwatch_kms_key_policy" {
  key_id = aws_kms_key.cloudwatch_kms_key.id
  policy = jsonencode(
    {
      Version = "2012-10-17"
      Id      = "key-default-1"
      Statement = [
        {
          Sid    = "Enable IAM User Permissions"
          Effect = "Allow"
          Principal = {
            AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
          },
          Action   = "kms:*"
          Resource = "*"
        },
        {
          Sid    = "Enable CW Permissions"
          Effect = "Allow"
          Principal = {
            Service = "logs.${var.region}.amazonaws.com"
          },
          Action = ["kms:Encrypt*",
            "kms:Decrypt*",
            "kms:ReEncrypt*",
            "kms:GenerateDataKey*",
          "kms:Describe*"]
          Resource = [aws_kms_key.cloudwatch_kms_key.arn]
        }
      ]
    }
  )
}
