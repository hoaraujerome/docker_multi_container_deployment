variable "iac_tool" {
  type        = string
  description = "Name of the IAC tool used to provision the infra"
  default     = "terraform"
}

variable "project" {
  type        = string
  description = "Project's name"
}

variable "project_modules" {
  type        = set(string)
  description = "Project's modules"
}