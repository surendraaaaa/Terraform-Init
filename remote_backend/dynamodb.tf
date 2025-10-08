resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name         = "tf-state-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "tf-state-locking"
  }
}
