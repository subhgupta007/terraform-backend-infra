resource "aws_dynamodb_table" "shakti_terraform_backend_state_lock_stage" {
  name         = "shakti-terraform-backend-state-lock-stage"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Environment = "stage"
    Service     = "shakti-terraform-backend-terraform-infra"
  }
}
