provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "example" {
  ami                    = "ami-04505e74c0741db8d"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, world" > index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF

  tags = {
    Name = "terraform-example"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "server_port" {
  type        = number
  description = "The port the server will use for HTTP Requests"
  default     = 8080
}

output "public_ip" {
  value       = "aws_instance.example.public_ip"
  description = "The public ip address of the web server"
}
