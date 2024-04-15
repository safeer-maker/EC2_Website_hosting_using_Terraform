variable "project_name" {
  type = string
  default = "web_tf"
}

variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

variable "max_subnet" {
  type = number
  default = 2

  # apply validation between 1 to 5
  validation {
    condition = var.max_subnet > 0 && var.max_subnet < 6
    error_message = "max_subnet should be between 1 to 5"
  }
}
