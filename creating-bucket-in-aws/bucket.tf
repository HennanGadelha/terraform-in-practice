resource "aws_s3_bucket" "example" {
  bucket = "hennangadelhadev-terraform-in-practice"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}