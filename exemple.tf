provider "aws" {
  profile    = "default"
  region     = "us-west-2"
}

#test the usage of a bucket
resource "aws_s3_bucket" "firstone" {
  # NOTE: S3 bucket names must be unique across _all_ AWS accounts, so
  # this name must be changed before applying this example to avoid naming
  # conflicts.
  bucket = "terraform-mybucketthat-dont-exist-anywhere-else"
  acl    = "private"
}

#an 'elastic' ip
resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.firstone.id
}

#the ec2 instance itself that depend to s3 bucket
resource "aws_instance" "firstone" {
  ami           = "ami-fa82739a"
  instance_type = "t2.micro"
  depends_on = [aws_s3_bucket.firstone]
}

#add another instance not relataed to s3 bucket
resource "aws_instance" "secondone" {
  ami           = "ami-fa82739a"
  instance_type = "t2.micro"
}
