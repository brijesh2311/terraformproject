provider "aws" {
	region     = "us-west-2"
	profile = "terraformchirag"
}
resource "aws_s3_bucket" "mybucket" {
	bucket = "mybucketchirag-11112020"
	acl = "private"
		tags = {
	Environment = "Dev"
	}
}

resource "aws_s3_bucket_object" "myfirstobject" {
  bucket = "${aws_s3_bucket.mybucket.id}"
  key    = "test.txt"
  source = "../s3files/test.txt"
  etag = "${md5(file("../s3files/test.txt"))}"
  #etag = filemd5("../s3file/test.txt")
}