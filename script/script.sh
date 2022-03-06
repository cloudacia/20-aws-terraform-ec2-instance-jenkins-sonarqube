#!/bin/bash
###############################################
# Install Uitls package                       #
###############################################
function InstallTools(){
  sudo yum install yum-utils -y
  sudo yum install git -y
  sudo yum install wget  -y
}

###############################################
# Install Docker repo                         #
###############################################
function InstallDockerRepo(){
  repo_url="https://download.docker.com/linux/centos/docker-ce.repo"
  sudo yum-config-manager --add-repo $repo_url
}

###############################################
# Install Docker                              #
###############################################
function InstallDocker(){
  sudo yum install docker-ce docker-ce-cli containerd.io -y
  sudo systemctl start docker
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
  sudo yum install epel-release -y
}

###############################################
# Install Jenkins                             #
###############################################
function InstallJenkins(){
  sudo yum install jenkins -y
}

###############################################
# Disable Jenkins Wizard configuration        #
###############################################
function JenkinsDisableWizard(){
  jenkins_path="/var/lib/jenkins/"
  sudo mkdir "$jenkins_path"/init.groovy.d
  sudo cat << EOF > "$jenkins_path"/init.groovy.d/basic-security.groovy
#!groovy

import jenkins.model.*
import hudson.util.*;
import jenkins.install.*;

def instance = Jenkins.getInstance()

instance.setInstallState(InstallState.INITIAL_SETUP_COMPLETED)
EOF

  echo 'export JAVA_ARGS="Djenkins.install.runSetupWizard=false"' >> /etc/profile
  echo 'export JAVA_ARGS="Djenkins.install.runSetupWizard=false"' >> /etc/profile.d/sh.local
  chmod 0755 /etc/profile.d/sh.local
  source /etc/profile
  export JAVA_ARGS="Djenkins.install.runSetupWizard=false"
  cat <<EOF >> /etc/environment
JAVA_ARGS=Djenkins.install.runSetupWizard=false
EOF
}

###############################################
# Start Jenkins                               #
###############################################
function StartJenkins(){
  sudo usermod -aG docker jenkins
  sudo systemctl enable jenkins
  sudo systemctl start jenkins
}

###############################################
# Install YUM utils                           #
###############################################
function InstallYumUtils(){
  sudo yum install -y yum-utils
}

###############################################
# Add HashipCorp repository                   #
###############################################
function AddHashiCorpRepo(){
  repo_url="https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo"
  sudo yum-config-manager --add-repo $repo_url
}

###############################################
# Install terraform                           #
###############################################
function InstallTerraform(){
  sudo yum -y install terraform
}


###############################################
# restart Jenkins                             #
###############################################
function RestartJenkins(){
  sudo systemctl restart jenkins
}

##################
# Script worflow #
##################
InstallTools
InstallDockerRepo
InstallDocker
InstallJava
JenkinsRepo
InstallEpel
InstallJenkins
JenkinsDisableWizard
StartJenkins
InstallYumUtils
AddHashiCorpRepo
InstallTerraform
RestartJenkins
