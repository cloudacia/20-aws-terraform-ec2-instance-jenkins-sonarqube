# AWS S3 BUCKET
resource "aws_s3_bucket" "bucket01" {
  bucket = "cloudacia-jenkins-jsac-files"
  acl    = "private"
}

# AWS UPLOAD FILE TO S3 BUCKET
resource "aws_s3_bucket_object" "object01" {
  bucket = aws_s3_bucket.bucket01.id
  key    = "jenkins-plugin-manager-2.12.3.jar"
  acl    = "private"
  source = "files/jenkins-plugin-manager-2.12.3.jar"
}

# AWS UPLOAD FILE TO S3 BUCKET
resource "aws_s3_bucket_object" "object02" {
  bucket = aws_s3_bucket.bucket01.id
  key    = "plugins.txt"
  acl    = "private"
  source = "files/plugins.txt"
}

# AWS UPLOAD FILE TO S3 BUCKET
resource "aws_s3_bucket_object" "object03" {
  bucket = aws_s3_bucket.bucket01.id
  key    = "jenkins.yaml"
  acl    = "private"
  source = "files/jenkins.yaml"
}
