









# Private subnet
resource "aws_subnet" "nextcloud_db_subnet" {
  vpc_id = "vpc-dc8c93be"
  cidr_block = var.private_subnet_cidr
  availability_zone = "us-gov-west-1b"

  tags = {
    Name = "Nextcloud db private subnet"
  }
}

resource "aws_db_subnet_group" "nextcloud_db_subnet_grp" {
  name       = "nextcloud db subnet group"
  subnet_ids = ["subnet-d98791bb", aws_subnet.nextcloud_db_subnet.id]

  tags = {
    Name = "Nextcloud db subnet group"
  }
}




