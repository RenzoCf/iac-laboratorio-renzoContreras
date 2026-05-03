
output "upload_lambda_arn" {
  value = aws_lambda_function.upload_lambda.arn
}

output "upload_lambda_name" {
  value = aws_lambda_function.upload_lambda.function_name
}