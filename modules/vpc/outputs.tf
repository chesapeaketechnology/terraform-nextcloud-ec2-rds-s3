



output "private_subnet_id" {
  value = aws_subnet.nextcloud_db_subnet.id
}

output "subnet_group" {
  value = aws_db_subnet_group.nextcloud_db_subnet_grp.id
}