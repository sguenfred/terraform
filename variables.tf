#use variable from https://learn.hashicorp.com/terraform/getting-started/variables
#simple variable 
variable "region" {
  default = "us-west-2"
}

#define a map
variable "amis" {
  type = "map"
  default = {
    "us-east-1" = "ami-b374d5a5"
    "us-west-2" = "ami-4b32be2b"
  }
}
