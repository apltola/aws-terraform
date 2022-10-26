variable "prefix" {
  default = "nodeapi"
}

variable "project" {
  default = "node-api"
}

variable "contact" {
  default = "aleksi.peltola@orangit.fi"
}

variable "db_username" {
  description = "Username for the RDS postgres instance"
}

variable "db_password" {
  description = "Password for the RDS postgres instance"
}

variable "ecr_image_api" {
  description = "ECR image for API"
  default     = "188405059934.dkr.ecr.eu-north-1.amazonaws.com/node-api:latest"
}
