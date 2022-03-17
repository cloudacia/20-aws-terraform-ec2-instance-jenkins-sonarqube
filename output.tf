# VPC ID
output "vpc_id" {
  value = aws_vpc.development.id
}

# EC2 INSTANCE PUBLIC IP ADDRESS
output "ec_jenkins_instance" {
  value = aws_instance.jenkins_instance.public_ip
}

# EC2 INSTANCE PUBLIC IP ADDRESS
output "ec_sonarqube_instance" {
  value = aws_instance.sonarqube_instance.public_ip
}
