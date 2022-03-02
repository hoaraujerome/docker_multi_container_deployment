resource "aws_db_subnet_group" "postgres" {
  name       = "${var.project}-${var.environment}-postgres"
  subnet_ids = var.vpc_private_subnet_ids

  tags = {
    Name      = "${var.project}-${var.environment}-postgres"
    ManagedBy = "${var.iac_tool}"
  }
}

resource "aws_db_instance" "postgres" {
  allocated_storage = 20
  engine            = "postgres"
  engine_version    = "12"
  instance_class    = "db.t2.micro"
  # Can't use var.project because only lowercase alphanumeric characters and hyphens allowed
  identifier             = "docker-multi-container-deployment-${var.environment}-postgres"
  username               = "postgres"
  password               = "postgres_password"
  port                   = var.postgres_port
  db_subnet_group_name   = aws_db_subnet_group.postgres.name
  vpc_security_group_ids = [var.app_security_group_id]
  skip_final_snapshot    = true

  tags = {
    Name      = "${var.project}-${var.environment}-postgres"
    ManagedBy = "${var.iac_tool}"
  }
}