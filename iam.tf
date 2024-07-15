data "aws_iam_policy_document" "lambda_assume_data_protection_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda_data_protection_role" {
  name               = "lambda-data-protection-role"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_data_protection_policy.json
}


data "aws_iam_policy" "cloudwatch_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "attach_cloudwatch_policy_to_role" {
  role       = aws_iam_role.lambda_data_protection_role.name
  policy_arn = data.aws_iam_policy.cloudwatch_policy.arn
}
