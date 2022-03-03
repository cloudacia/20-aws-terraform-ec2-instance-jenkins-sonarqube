#!/bin/bash
###############################################
# Install Yum Uitls package                   #
###############################################
function InstallYumUtils(){
  sudo yum install -y yum-utils
}

###############################################
# Install Docker repo                         #
###############################################
function InstallDockerRepo(){
  sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
}

###############################################
# Install Docker                              #
###############################################
function InstallDocker(){
  sudo yum install docker-ce docker-ce-cli containerd.io -y
  sudo systemctl start docker
}

###############################################
# Install utility packages                    #
###############################################
function InstallUtils(){
  sudo yum install wget -y
  sudo sudo yum install git -y
}

###############################################
# Install Docker Compose                      #
###############################################
function InstallDockerCompose(){
  docker_repo="https://github.com/docker/compose/releases/download/1.29.2/docker-compose"
  docker_bin="/usr/local/bin/docker-compose"
  sudo curl -L "$docker_repo-$(uname -s)-$(uname -m)" -o "$docker_bin"
  sudo chmod +x "$docker_bin"
  sudo ln -s "$docker_bin" /usr/bin/docker-compose
}

##################
# Script worflow #
##################
InstallYumUtils
InstallDockerRepo
InstallDocker
InstallUtils
InstallDockerCompose
