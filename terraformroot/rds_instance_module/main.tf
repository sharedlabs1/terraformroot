resource "aws_db_instance" "this" {
  identifier = var.db_instance_identifier
  engine     = var.db_engine

  instance_class = var.db_instance_class
  allocated_storage = var.allocated_storage
  db_name          = var.db_name
  username         = var.username
  password         = var.password

  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name = aws_db_subnet_group.this.name

  tags = {
    Name = "RDSInstance"
  }
}

resource "aws_db_subnet_group" "this" {
  name       = "${var.db_instance_identifier}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "RDSSubnetGroup"
  }
}
