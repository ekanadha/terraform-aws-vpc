resource "aws_db_subnet_group" "db-subnetgroup" {
  name       = var.db_name
 subnet_ids = ["subnet-01d97bd66f8b422a2", 
              "subnet-064ff4b0fd7e60dca",
              "subnet-0cde2fc4a88e30567"]

  tags = {
    Name = var.db_name
  }
}


resource "aws_db_instance" "mysql" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  db_name                = "mydb"
  username               = "devapiuser"
  password               = "9573972811Mahi"
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.db-subnetgroup.name
  vpc_security_group_ids = ["${aws_security_group.rds-sg.id}"]

  tags = {
    Name = var.mysql_name
  }

}