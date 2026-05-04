terraform {
   backend s3 {
        bucket = "bucket-name-here"
        dynamodb_table = "state-lock"
       key = "global/mystatefile/terraform.tfstate"
        region = "us-east-1"
        encrypt = true
    }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0" # Use a specific version for reliability
    }
  }
}

provider "aws" {
  region = "us-east-1"
  # Authentication is typically handled via AWS CLI environment variables
}
