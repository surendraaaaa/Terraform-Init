terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.15.0"
    }
  }

  backend "s3" {
    bucket         = "my-terraform-bucket-fd0e0784"
    key            = "terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "tf-state-locking"
  }
}
