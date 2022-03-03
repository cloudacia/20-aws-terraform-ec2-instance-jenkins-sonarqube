#!/bin/bash
###############################################
# Install Yum Uitls package                   #
###############################################
function InstallYumUtils(){
  sudo yum install -y yum-utils
}

###############################################
# Install Java OpenJDK                        #
###############################################
function InstallJava(){
  java_package="java-11-openjdk-devel"
  sudo yum install $java_package -y
}

###############################################
# Install Jenkins repository                  #
###############################################
function JenkinsRepo(){
  repo_file="/etc/yum.repos.d/jenkins.repo"
  repo_url="https://pkg.jenkins.io/redhat-stable/jenkins.repo"
  repo_key="https://pkg.jenkins.io/redhat-stable/jenkins.io.key"

  sudo wget -O $repo_file $repo_url --no-check-certificate
  sudo rpm --import $repo_key
}

###############################################
# Install EPEL repository                     #
###############################################
function InstallEpel(){
  sudo sudo yum install epel-release -y
}

###############################################
# Install Jenkins                             #
###############################################
function InstallJenkins(){
  sudo yum install jenkins -y
}

###############################################
# Start Jenkins                               #
###############################################
function StartJenkins(){
  sudo systemctl start jenkins
  sudo systemctl enable jenkins
}

##################
# Script worflow #
##################
InstallYumUtils
InstallJava
JenkinsRepo
InstallEpel
InstallJenkins
StartJenkins
