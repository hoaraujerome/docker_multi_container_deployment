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

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "vpc_public_subnet_ids" {
  type        = list(string)
  description = "Public Subnet IDs"
}

variable "vpc_private_subnet_ids" {
  type        = list(string)
  description = "Private Subnet IDs"
}

variable "app_security_group_id" {
  type        = string
  description = "Application Security Group ID"
}

variable "redis_host" {
  type        = string
  description = "Redis hostname"
}

variable "redis_port" {
  type        = string
  description = "Redis port"
}

variable "postgres_host" {
  type        = string
  description = "Postgres host"
}

variable "postgres_port" {
  type        = string
  description = "Postgres port"
}

variable "postgres_database" {
  type        = string
  description = "Postgres database name"
}

variable "postgres_username" {
  type        = string
  description = "Postgres username"
}

variable "postgres_password" {
  type        = string
  description = "Postgres password"
  sensitive   = true
}
