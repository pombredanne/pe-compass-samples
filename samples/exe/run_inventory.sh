#! /bin/bash

for x in $(ls); do cat $x | jq --arg FILENAME $x '{name: .name, sha2: .hashes.sha2, url: "https://raw.githubusercontent.com/dfirence/pe-compass-samples/master/samples/exe/\($FILENAME)"}' >> temp.json;done
cat temp.json | jq -s > inventory.json
