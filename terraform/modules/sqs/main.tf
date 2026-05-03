resource "aws_sqs_queue" "main_queue" {
  name                      = "image-processor-queue-${var.env}"
  visibility_timeout_seconds = 360 # Según tu diagrama
  
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq.arn
    maxReceiveCount     = 3
  })
}

resource "aws_sqs_queue" "dlq" {
  name = "image-processor-dlq-${var.env}"
}

output "queue_arn" {
  value = aws_sqs_queue.main_queue.arn
}