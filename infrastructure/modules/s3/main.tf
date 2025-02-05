terraform {
  backend "s3" {
    bucket         = "terraform-backend-ts"        
    key            = "backend-db/terraform.tfstate"               
    region         = "us-east-1"                  
    dynamodb_table = "terraform-db-state-locks"     
    encrypt        = true                         
  }
}


resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-db-state-locks"   # Name of the DynamoDB table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Environment = "prod"
    Name        = "Terraform-db-StateLocks"
  }
}
