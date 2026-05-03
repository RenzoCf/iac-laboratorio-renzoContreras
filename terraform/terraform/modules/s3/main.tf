resource "aws_s3_bucket" "images" {
  bucket = "image-processor-${var.env}-images-${var.suffix}"
}

# Configuración de ciclo de vida (Lifecycle) según diagrama: 30 días uploads, 90 procesados
resource "aws_s3_bucket_lifecycle_configuration" "rules" {
  bucket = aws_s3_bucket.images.id

  rule {
    id     = "expire-uploads"
    status = "Enabled"
    filter { prefix = "uploads/" }
    expiration { days = 30 }
  }

  rule {
    id     = "expire-processed"
    status = "Enabled"
    filter { prefix = "processed/" }
    expiration { days = 90 }
  }
}