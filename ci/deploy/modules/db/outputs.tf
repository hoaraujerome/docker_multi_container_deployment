output "postgres_host" {
  value = aws_db_instance.postgres.address
}

output "postgres_port" {
  value = aws_db_instance.postgres.port
}

output "postgres_database" {
  value = aws_db_instance.postgres.identifier
}

output "postgres_username" {
  value = aws_db_instance.postgres.username
}

output "postgres_password" {
  value = aws_db_instance.postgres.password
}