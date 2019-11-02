# AWS設定
provider "aws" {
  region   = "${var.aws["region"]}"
  profile  = "${var.aws["profile"]}"
}

# S3バケットの作成
resource "aws_s3_bucket" "HogeSampleImage" {
  bucket = "hoge-sample-images"
  acl    = "private"
}
