resource "aws_db_instance" "db" {
  name                = "my_db"
  instance_class      = "${var.DB_INSTANCE_TYPE}"
  engine              = "postgres"
  engine_version      = "${var.ENGINE_VERSION}"
  storage_type        = "gp2"
  deletion_protection = "${var.DB_DELETION_PROTECTION}"
  storage_encrypted   = "${var.ENCRYPTED}"
  tags = {
    yor_trace = "ab520d46-571c-46c5-a541-f4f46fcda866"
  }
}
