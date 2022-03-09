# AWS EC2 INSTANCE
resource "aws_instance" "jenkins_instance" {
  connection {
    type = "ssh"
    user = "centos"
    host = self.public_ip
  }
  ami                         = var.aws_amis
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.user_key.key_name
  vpc_security_group_ids      = [aws_security_group.jenkins.id]
  subnet_id                   = aws_subnet.subnet01.id
  iam_instance_profile        = aws_iam_instance_profile.instance_profile01.id
  user_data                   = filebase64("script/jenkins_bootstrapping.sh")
  associate_public_ip_address = true

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }

  tags = {
    Name = "Jenkins"
  }
}

resource "aws_instance" "anchore_instance" {
  connection {
    type = "ssh"
    user = "centos"
    host = self.public_ip
  }
  ami                         = var.aws_amis
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.user_key.key_name
  vpc_security_group_ids      = [aws_security_group.anchore.id]
  subnet_id                   = aws_subnet.subnet01.id
  iam_instance_profile        = aws_iam_instance_profile.instance_profile01.id
  user_data                   = filebase64("script/anchore_bootstrapping.sh")
  associate_public_ip_address = true

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }

  tags = {
    Name = "Anchore"
  }
}
