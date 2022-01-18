provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-example"
  }
}

#data "aws_ami" "ubuntu" {
#  most_recent = true
#
#  filter {
#    name   = "name"
#    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#  }
#
#  filter {
#    name   = "virtualization-type"
#    values = ["hvm"]
#  }
#
#  owners = ["099720109477"] # Canonical
#}
#
#resource "aws_instance" "web" {
#  ami           = data.aws_ami.ubuntu.id
#  instance_type = "t3.micro"
#
#  tags = {
#    Name = "HelloWorld"
#  }
#}

