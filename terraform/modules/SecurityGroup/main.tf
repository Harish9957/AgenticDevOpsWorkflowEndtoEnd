data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "this" {
  name        = "${var.name_prefix}-sg"
  description = "Single-IP SSH ingress, HTTPS-only egress"
  vpc_id      = data.aws_vpc.default.id

  tags = var.tags
}

# Inbound: only the allowed IP on the configured port
resource "aws_vpc_security_group_ingress_rule" "allowed_ip" {
  security_group_id = aws_security_group.this.id
  cidr_ipv4         = var.allowed_cidr
  ip_protocol       = "tcp"
  from_port         = var.ingress_port
  to_port           = var.ingress_port

  tags = var.tags
}

# Outbound: HTTPS to any IP
resource "aws_vpc_security_group_egress_rule" "https" {
  security_group_id = aws_security_group.this.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443

  tags = var.tags
}
