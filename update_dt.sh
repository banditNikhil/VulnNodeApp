#!/bin/bash

curl -sL https://deb.nodesource.com/setup_10.x | sudo bash - &&\
sudo apt-get update && \
sudo apt install npm && npm install && \
sudo npm -g install git+https://github.com/CycloneDX/cyclonedx-node-module && \
sudo apt install curl && \
cyclonedx-bom -o bom.xml && ls && 

 cat > bom.json <<__HERE__                                                                                                                                                                      
 {
   "project": "$2",
   "scan": "$(cat bom.xml  |base64 -w 0 -)"
 }
 __HERE__


echo $1
echo $2

head bom.json

curl -X "PUT" "http://dt.klickstartonline.com:8080/api/v1/bom" \
-H 'Content-Type: application/json' \
-H 'X-API-Key: $1' \
-d @bom.json
