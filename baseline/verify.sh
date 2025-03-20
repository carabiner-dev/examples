#! /bin/bash

echo "🔎 Verifying Branch"

go run ./cmd/ampel verify \
    --subject sha256:52e2da8f663cfb629f98dac2708106b139f851386a723faeba4dde373c24e844 \
    --policy examples/baseline/osps.branch.policy.json \
    --attestation examples/baseline/carabiner-demo-repo.branches.intoto.json

echo "🔎 Verifying Repositoryh"

go run ./cmd/ampel verify \
    --subject sha256:73b9f9806668f6fccf8f49cb0c778bb4fb054f49003ba726fd59913e429154da \
    --policy examples/baseline/osps.repo.policy.json \
    --attestation examples/baseline/carabiner-demo-repo.repo.intoto.json 

echo "🔎 Verifying Organization"

go run ./cmd/ampel/ verify \
    --subject sha256:5fa2c0832bb275b97c7fb69a9dc186a3e2dcb62866070ed28bb6169cf4fd30f7 \
    --policy examples/baseline/osps.org.policy.json \
    --attestation examples/baseline/carabiner.mfa.intoto.json 

echo "🔎 Verifying Commit"

go run ./cmd/ampel/ verify \
    --subject sha1:415b73555cea15d55a6508673a9c63b3f8bdf628 \
    --policy examples/baseline/osps.sbom.policy.json \
    --attestation examples/baseline/carabiner-demo-repo.si.bundle.json \
    --attestation examples/baseline/carabiner-demo-repo.spdx.intoto.json 
