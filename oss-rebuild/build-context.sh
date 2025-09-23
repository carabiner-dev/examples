#!/usr/bin/env bash

# This script reads the packages attested by google's OSS Rebuild project and
# generates a JSON context file to use in ampel when evaluating the policy.
#
# The script requires the gsutil utility to read the GCP bucket where the
# attestations are stored and jq to format the data into a JSON document.

for n in $(gsutil ls gs://google-rebuild-attestations/npm/ | awk -F / '{print $(NF-1)}'); do if [[ $n != "@"* ]]; then echo $n; else for s in $(gsutil ls "gs://google-rebuild-attestations/npm/$n" | awk -F/ '{print $(NF-1)}'); do echo "$n/$s"; done; fi; done | jq -Rs '{packages: split("\n") | map(select(length > 0))}'
