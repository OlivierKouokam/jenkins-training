#!/bin/bash

# Make sure jenkins data folder exit
mkdir -p $HOME/data/jenkins-pv

# Get the home directory
HOME_PATH=$HOME

# Make jenkins-deployment.yml writtable
sudo chmod 777 jenkins-deployment.yml

# Replace the placeholder in the template YAML with the actual path
sed "s|{{HOME_PATH}}|$HOME_PATH|g" jenkins-deployment.yml | sudo kubectl apply -f -
