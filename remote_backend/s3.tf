resource "random_id" "bucket_suffix" {

  byte_length = 4

}

resource "aws_s3_bucket" "my_bucket" {

  bucket        = "my-terraform-bucket-${random_id.bucket_suffix.hex}"
  force_destroy = true

  tags = {
    "Name" = "my-terraform-bucket-${random_id.bucket_suffix.hex}"
  }

}
