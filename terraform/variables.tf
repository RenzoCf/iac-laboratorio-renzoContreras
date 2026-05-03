variable "env" {
  description = "Entorno de despliegue (dev, qa, prod)"
  type        = string
}

variable "suffix" {
  description = "Sufijo único para evitar nombres duplicados en S3"
  type        = string
  default     = "renzo2003" # El nombre que aparece en tu consola de AWS [cite: 5]
}

variable "region" {
  default = "us-east-1" # La que exige el diagrama [cite: 3]
}