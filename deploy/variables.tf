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
