output "upload_lambda_role_arn" {
  value = aws_iam_role.upload_role.arn
}

output "crop_lambda_role_arn" {
  value = aws_iam_role.crop_role.arn
}