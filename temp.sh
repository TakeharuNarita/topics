#!/bin/bash

# Update the apt package list.
sudo apt-get update -y

# Install MySQL Workbench
sudo apt-get install -y mysql-workbench

# Verify installation
mysql-workbench --version
