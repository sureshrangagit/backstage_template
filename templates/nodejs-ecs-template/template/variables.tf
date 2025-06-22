variable "service_name" {
  type        = string
  description = "The name of the service"
}

variable "docker_image" {
  type        = string
  description = "The Docker image to use for the ECS container"
}

variable "subnets" {
  type        = list(string)
  description = "Subnets for the ECS service"
}

variable "security_groups" {
  type        = list(string)
  description = "Security groups for the ECS service"
}
