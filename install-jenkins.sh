#!/bin/bash

echo Updating system first.
sudo apt-get update

echo Installing Java
sudo apt install openjdk-8-jdk -y

echo Adding jenkins keys.
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add - 


echo Updating once more to find new jenkins package.
echo "deb https://pkg.jenkins.io/debian binary/" >> /etc/apt/sources.list | sudo bash


echo Updating system Again.
sudo apt update -y

echo Installing jenkins
sudo apt install jenkins -y

echo Starting jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo systemctl restart jenkins 
sudo systemctl enable jenkins
sudo systemctl restart jenkins

echo Opening Firewall for jenkins!
sudo ufw allow 8080
sudo ufw status



echo From here jenkins should be installed and can be access by pointing to localhost on port 8080. http://localhost:8080

