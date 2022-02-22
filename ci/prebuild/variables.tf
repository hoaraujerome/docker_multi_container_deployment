variable "iac_tool" {
  type        = string
  description = "Name of the IAC tool used to provision the infra"
  default     = "terraform"
}

variable "project" {
  type        = string
  description = "The name of the project"
  default     = "docker_multi_container_deployment"
}

variable "project_modules" {
  type    = set(string)
  default = ["client", "nginx", "worker", "server"]
}