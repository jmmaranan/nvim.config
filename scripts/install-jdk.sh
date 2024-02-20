#!/usr/bin/env bash

curl -s "https://get.sdkman.io" | bash
cp sdkman/config ${HOME}/.sdkman/etc/config
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 8.0.402-amzn
sdk install java 11.0.22-amzn
sdk install java 17.0.10-amzn
