variable "iac_tool" {
  type        = string
  description = "Name of the IAC tool used to provision the infra"
}

variable "project" {
  type        = string
  description = "The name of the project"
}

variable "environment" {
  type        = string
  description = "Infrastructure environment"
}

variable "vpc_private_subnet_ids" {
  type        = list(string)
  description = "Private Subnet IDs"
}

variable "redis_port" {
  type        = number
  description = "Redis port"
}

variable "app_security_group_id" {
  type        = string
  description = "Application Security Group ID"
}