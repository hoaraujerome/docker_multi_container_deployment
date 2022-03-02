resource "aws_elasticache_subnet_group" "redis" {
  # Can't use var.project because only lowercase alphanumeric characters and hyphens allowed
  name       = "docker-multi-container-deployment-${var.environment}-redis"
  subnet_ids = var.vpc_private_subnet_ids
}

resource "aws_elasticache_cluster" "redis" {
  # Can't use var.project because only lowercase alphanumeric characters and hyphens allowed
  cluster_id               = "docker-multi-container-deployment-${var.environment}-redis"
  engine                   = "redis"
  node_type                = "cache.t2.micro"
  num_cache_nodes          = 1
  parameter_group_name     = "default.redis6.x"
  engine_version           = "6.x"
  port                     = var.redis_port
  subnet_group_name        = aws_elasticache_subnet_group.redis.name
  security_group_ids       = [var.app_security_group_id]
  snapshot_retention_limit = 0

  tags = {
    Name      = "${var.project}-${var.environment}-redis"
    ManagedBy = "${var.iac_tool}"
  }
}