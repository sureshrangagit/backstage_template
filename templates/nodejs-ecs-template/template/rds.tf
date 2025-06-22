resource "aws_db_instance" "default" {
  identifier        = "${var.service_name}-mysql"
  engine            = "mysql"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  name              = "${var.service_name}_db"
  username          = "admin"
  password          = "supersecret"
  publicly_accessible = true
  skip_final_snapshot = true
}
