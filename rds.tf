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
publicly_accessible = true
vpc_security_group_ids   = ["${aws_security_group.mydb1.id}"]
}

resource "aws_db_subnet_group" "db_subnet" {
name = "db subnet group"
subnet_ids = aws_subnet.public_subnet.*.id
#  subnet_ids = aws_subnet.public_subnet..id
}

resource "aws_security_group" "mydb1" {
  name = "mydb1"

  description = "RDS postgres servers (terraform-managed)"
  vpc_id = "${aws_vpc.vpc.id}"

  # Only postgres in
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic.
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
