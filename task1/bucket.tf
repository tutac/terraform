resource "aws_s3_bucket" "tutac" {
  bucket = "tutac"
  acl    = "private"
    
    versioning {
    enabled = true
  }


  tags = {
    Name        = "tutac"
    Environment = "Dev"
  }
}