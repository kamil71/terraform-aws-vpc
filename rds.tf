resource "aws_db_instance" "my-rds" {
allocated_storage = 20
identifier = "testinstance"
storage_type = "gp2"
engine = "mysql"
engine_version = "5.7"
instance_class = "db.t3.micro"
db_name = "test"
username = "admin"
password = "Admin54132"
parameter_group_name = "default.mysql5.7"
db_subnet_group_name = aws_db_subnet_group.db_subnet.id
}

resource "aws_db_subnet_group" "db_subnet" {
name = "db subnet group"
subnet_ids = aws_subnet.private_subnet.*.id
}