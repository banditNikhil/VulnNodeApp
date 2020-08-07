#!/bin/bash

curl -sL https://deb.nodesource.com/setup_10.x | sudo bash - 
sudo apt-get update 
sudo apt install npm && npm install 
sudo npm -g install git+https://github.com/CycloneDX/cyclonedx-node-module 
sudo apt install curl 
cyclonedx-bom -o bom.xml 

cat > bom.json <<__HERE__
{
"project": "9c396cce-e68f-48a2-a342-38cc891b66a1",
"bom": "$(cat bom.xml |base64 -w 0 -)"
}
__HERE__
