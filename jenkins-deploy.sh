#!/bin/bash

# Make sure jenkins data folder exit
sudo mkdir -p $HOME/data/jenkins-pv

# Get the home directory
HOME_PATH=$HOME

# Replace the placeholder in the template YAML with the actual path
sed "s|{{HOME_PATH}}|$HOME_PATH|g" jenkins-deployment.yml | kubectl apply -f -
