resource "aws_instance" "nginx_instance" {
  ami           = data.aws_ami.debian12.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ec2_key_pair.key_name
  subnet_id     = aws_subnet.main_subnet.id
  security_groups = [aws_security_group.main_sg.name]

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update -y
    sudo apt-get install nginx -y
    sudo systemctl start nginx
  EOF

  tags = {
    Name = "${var.projeto}-${var.candidato}-ec2-nginx"
  }
}
