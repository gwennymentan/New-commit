resource "aws_s3_bucket" "homework" {
  bucket = "homework"
 acl    = "private"

  tags = {
    Name        = "Mygithub-bucket1"
    Environment = "Dev"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.mykmskey.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

resource "aws_kms_key" "mykmskey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}





resource "aws_iam_role" "s3_role1" {
  name = "s3_role1"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}




resource "aws_iam_role_policy" "s3_policy" {
  name = "s3_policy"
  role = aws_iam_role.s3_role1.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode(
    {
   "Version": "2012-10-17",
   "Statement": [
    {
      "Sid": "Stmt1638672535823",
      "Action": [
        "s3:GetObject",
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "Stmt1638675164899",
      "Action": [
        "s3:GetObject",
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
  )
}







  