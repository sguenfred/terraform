provider "aws" {
  profile    = "default"
  region     = "us-east-1"
}
#an 'elastic' ip
resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.firstone.id
}

#the ec2 instance itself
resource "aws_instance" "firstone" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
}
