resource "aws_s3_bucket" "example" {
  bucket = "hennangadelhadev-terraform"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}