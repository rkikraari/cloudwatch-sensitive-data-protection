module "lambda" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "7.7.0"

  depends_on = [aws_cloudwatch_log_group.data_protection_lambda_log_group]

  function_name                     = var.data_protection_lambda_name
  description                       = "A lambda used to log sensitive data and test CloudWatch Data Protection Capability"
  handler                           = "logging_lambda.lambda_handler"
  runtime                           = "python3.12"
  source_path                       = "./python"
  logging_log_group                 = aws_cloudwatch_log_group.data_protection_lambda_log_group.name
  lambda_role                       = aws_iam_role.lambda_data_protection_role.arn
  use_existing_cloudwatch_log_group = true
  timeout                           = 10
  create_role                       = false
}
