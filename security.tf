# AWS SECURITY GROUP FOR EC2 INSTANCES
resource "aws_security_group" "jenkins" {
  name        = "Jenkins"
  description = "Allow web incgress trafic"
  vpc_id      = aws_vpc.development.id

  # Jenkins port
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # http port
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # ssh port
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  # Open access to public network
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Jenkins"
  }
}


resource "aws_security_group" "anchore" {
  name        = "Anchore"
  description = "Allow web incgress trafic"
  vpc_id      = aws_vpc.development.id

  # Jenkins Anchore
  ingress {
    description = "Allow incoming traffic Anchore API port"
    from_port   = 8228
    to_port     = 8228
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # ssh port
  ingress {
    description = "Allow incoming traffic to SSH port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Open access to public network
  egress {
    description = "Allow all outbount traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Jenkins"
  }
}
