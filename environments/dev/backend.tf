terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }

  # S3バックエンドの設定（必要に応じてコメント解除）
  # backend "s3" {
  #   bucket         = "yamada-agritech-terraform-state-dev"
  #   key            = "iot/terraform.tfstate"
  #   region         = "ap-northeast-1"
  #   encrypt        = true
  #   dynamodb_table = "terraform-state-lock-dev"
  # }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = "dev"
      Project     = "yamada-agritech"
      ManagedBy   = "terraform"
    }
  }
}
