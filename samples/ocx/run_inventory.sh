#! /bin/bash

for x in $(ls); do cat $x | jq --arg FILENAME $x '{name: .pe_name, sha2: .ImageHashSignatures.sha2, url: "https://raw.githubusercontent.com/dfirence/pe-compass-samples/master/samples/ocx/\($FILENAME)"}' >> temp.json;done
cat temp.json | jq -s > inventory.json
