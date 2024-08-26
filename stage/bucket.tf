# remote state s3 bucket
resource "aws_s3_bucket" "shakti_terraform_backend_stage" {
  bucket = "shakti-terraform-backend-stage"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  # enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Environment = "stage"
    Service     = "shakti-terraform-backend-terraform-infra"
  }
}

resource "aws_s3_bucket_public_access_block" "shakti_terraform_backend_stage" {
  bucket = aws_s3_bucket.shakti_terraform_backend_stage.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
