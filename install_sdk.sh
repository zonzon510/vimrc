#!/bin/bash

# install java
sudo apt install openjdk-13-jdk-headless

sudo apt install unzip zip
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install springboot
spring version

