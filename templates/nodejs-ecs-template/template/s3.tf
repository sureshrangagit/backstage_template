resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "service_bucket" {
  bucket = "${var.service_name}-bucket-${random_id.bucket_suffix.hex}"
  acl    = "private"
}
