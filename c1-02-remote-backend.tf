terraform {
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket  = "aws-bucket"
    key     = "prod/state-file/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true

    # For State Locking
    use_lockfile = true
    #dynamodb_table = "tf-state-file"

  }
}