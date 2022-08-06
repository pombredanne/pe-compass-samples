#! /bin/bash

for x in $(ls); do cat $x | jq --arg FILENAME $x '{name: .pe_name, sha2: .ImageHashSignatures.sha2, url: "https://raw.githubusercontent.com/dfirence/pe-compass-samples/master/samples/tsp/\($FILENAME)"}' >> temp_tsp.json;done
cat temp_tsp.json | jq -s > inventory_tsp.json
