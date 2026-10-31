variable "region" {
  description = "AWS region for the provider"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name, used in resource names and the Project tag"
  type        = string
  default     = "SimpleAgenticDevOpsWorkflow"
}

variable "environment" {
  description = "Environment name, used in resource names and the Environment tag"
  type        = string
  default     = "dev"
}

variable "domain_name" {
  description = "Optional custom domain for the site. Empty string disables it. Not yet wired to CloudFront aliases or ACM."
  type        = string
  default     = ""
}

variable "allowed_cidr" {
  description = "Single CIDR allowed to reach the security group on the ingress port"
  type        = string
  default     = "49.207.144.138/32"
}

variable "ingress_port" {
  description = "Inbound TCP port opened to allowed_cidr"
  type        = number
  default     = 22
}
