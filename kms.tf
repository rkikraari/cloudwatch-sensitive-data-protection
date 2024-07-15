resource "aws_kms_key" "cloudwatch_kms_key" {
  description             = "A symmetric encryption KMS key for CloudWatch"
  enable_key_rotation     = true
  deletion_window_in_days = 1
}

resource "aws_kms_key_policy" "cloudwatch_kms_key_policy" {
  key_id = aws_kms_key.cloudwatch_kms_key.id
  policy = data.aws_iam_policy_document.cloudwatch_kms_policy_document.json
}

data "aws_iam_policy_document" "cloudwatch_kms_policy_document" {

  statement {
    sid = "Allow CloudWatch Access to KMS Key"
    actions = ["kms:DescribeKey",
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey",
    "kms:GenerateDataKeyWithoutPlaintext"]
    resources = [aws_kms_key.cloudwatch_kms_key.arn]
    effect    = "Allow"
    principals {
      type        = "Service"
      identifiers = ["cloudwatch.amazonaws.com"]
    }
  }

  statement {
    sid    = "Enable IAM User Permissions"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.aws_account_id}:root"]
    }
    resources = [aws_kms_key.cloudwatch_kms_key.arn]
    actions   = ["kms.*"]
  }
}
