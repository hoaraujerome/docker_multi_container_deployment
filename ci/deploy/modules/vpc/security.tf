resource "aws_security_group" "docker_multi_container_app" {
  name        = "${var.project}-${var.environment}"
  description = "Security group for the application"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name      = "${var.project}-${var.environment}"
    ManagedBy = "${var.iac_tool}"
  }
}

resource "aws_security_group_rule" "app-sg_in_redis" {
  type                     = "ingress"
  from_port                = var.redis_port
  to_port                  = var.redis_port
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.docker_multi_container_app.id
  security_group_id        = aws_security_group.docker_multi_container_app.id
}

resource "aws_security_group_rule" "app-sg_in_postgres" {
  type                     = "ingress"
  from_port                = var.postgres_port
  to_port                  = var.postgres_port
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.docker_multi_container_app.id
  security_group_id        = aws_security_group.docker_multi_container_app.id
}