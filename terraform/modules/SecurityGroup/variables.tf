variable "name_prefix" {
  description = "Prefix for resource names, typically local.name_prefix from the root module"
  type        = string
}

variable "allowed_cidr" {
  description = "IPv4 CIDR block allowed to reach the ingress port"
  type        = string
  default     = "49.207.144.138/32"

  validation {
    condition     = can(cidrnetmask(var.allowed_cidr))
    error_message = "allowed_cidr must be a valid IPv4 CIDR block, e.g. 203.0.113.10/32."
  }
}

variable "ingress_port" {
  description = "TCP port opened for inbound traffic from allowed_cidr"
  type        = number
  default     = 22

  validation {
    condition     = var.ingress_port >= 1 && var.ingress_port <= 65535
    error_message = "ingress_port must be between 1 and 65535."
  }
}

variable "tags" {
  description = "Tags applied to all resources in this module"
  type        = map(string)
  default     = {}
}
