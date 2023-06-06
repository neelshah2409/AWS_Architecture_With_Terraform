resource "aws_instance" "My-web-instance1" {
  ami                         = "ami-0d52744d6551d851e" #Amazon linux 2 AMI
  key_name                    = "mykeypair"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.Public_subnet-1.id
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.custom_security_SG_DB.id]
  user_data                   = <<-EOF
        #!/bin/bash
        yum update -y
        yum install httpd -y
        systemctl start httpd
        systemctl enable httpd
        echo "<html><body><h1>This is My Custom Project Tier 1 </h1></body></html>" > /var/www/html/index.html
        EOF
}

resource "aws_instance" "My-web-instance2" {
  ami                         = "ami-0d52744d6551d851e" #Amazon linux 2 AMI
  key_name                    = "mykeypair"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.Public_subnet-2.id
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.custom_security_SG_DB.id]
  user_data                   = <<-EOF
        #!/bin/bash
        yum update -y
        yum install httpd -y
        systemctl start httpd
        systemctl enable httpd
        echo "<html><body><h1>This is My Custom Project Tier 2 </h1></body></html>" > /var/www/html/index.html
        EOF
}
