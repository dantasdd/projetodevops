provider "aws" {
  region     = "us-west-2"
  access_key = "vai curinthia"
  secret_key = "vai curinthia"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_s3_bucket" "a" {
  bucket = "my-tf-test-dantas"
  acl    = "private"

  tags = {
    Name        = "My bucket dantas"
    Environment = "Dev"
  }
}

