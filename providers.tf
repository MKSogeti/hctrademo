provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "terraform-backend-hctra-demo1"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "backend-tf"
  }
}
