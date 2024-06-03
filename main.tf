#create s3 bucket

resource "aws_s3_bucket" "zyusuf88-bucket" {
  bucket = var.bucketname

}

# S3 Bucket Ownership Controls
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.zyusuf88-bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
# make the bucket public 

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.zyusuf88-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

#public read acl

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.zyusuf88-bucket.id
  acl    = "public-read"
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.zyusuf88-bucket.id
  key = "index.html"
  source = "index.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.zyusuf88-bucket.id
  key = "error.html"
  source = "error.html"
  acl = "public-read"
  content_type = "text/html"

}

resource "aws_s3_object" "profile" {
  bucket = aws_s3_bucket.zyusuf88-bucket.id
  key = "image.png"
  source = "image.png"
  acl = "public-read"
}



resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.zyusuf88-bucket.id
  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  depends_on = [ aws_s3_bucket_acl.example ]
}