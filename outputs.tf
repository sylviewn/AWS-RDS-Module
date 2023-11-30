output "vpc_id" {
  value = aws_vpc.rds_vpc.id
}

output "subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "db_instance_address" {
  value = aws_db_instance.mysql_db.address
}

output "db_instance_endpoint" {
  value = aws_db_instance.mysql_db.endpoint
}

