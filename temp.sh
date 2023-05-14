#!/bin/bash

# Update the apt package list.
sudo apt-get update -y

# Install MySQL Workbench
sudo apt-get install mysql-workbench

# Verify installation
mysql-workbench --version
