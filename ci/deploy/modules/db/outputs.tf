output "postgres_host" {
  value = aws_db_instance.postgres.address
}

output "postgres_port" {
  value = aws_db_instance.postgres.port
}

output "postgres_database" {
  value = aws_db_instance.postgres.name
}

output "postgres_username" {
  value = aws_db_instance.postgres.username
}