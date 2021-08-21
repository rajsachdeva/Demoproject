#!/usr/bin/env bash

# Description : This scripts will install JDK,Jenkin and get the pwd for Jenkin
# Date 	      : 21/Aug/2021

# Update and Upgrade the ubuntu VM
sudo apt-get update -y
sudo apt-get upgrade -y

# Install JDK
sudo apt install openjdk-8-jdk

#Add the repository key to the system:
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

#Append the Debian package repository address to the server’s
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

#Update so that apt will use the new repository
sudo apt update

#Install Jenkins and its dependencies.
sudo apt install jenkins

#start Jenkins by using systemctl
sudo systemctl start jenkins

#Jenkin display the status
sudo systemctl status jenkins

#Open the firewall port on 8080
sudo ufw allow 8080

#Active the firewall,if it is inactive
sudo ufw allow OpenSSH
sudo ufw enable -y

#Check the firewall status
sudo ufw status

#get the password for jenkin
sudo cat /var/lib/jenkins/secrets/initialAdminPassword