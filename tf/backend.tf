terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.82.2"
    }
  }
#   backend "s3" {
#     bucket = "tf-backend-vaibhav-4d4d332de4f343"
#     key = "backend.tfstate"
#     region = "eu-north-1"
#   }
}
