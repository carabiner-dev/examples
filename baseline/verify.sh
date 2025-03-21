#! /bin/bash

echo "🔎 Verifying Branch"

if [ -z "$EXAMPLES_PATH" ]
then
      EXAMPLES_PATH="../examples/baseline"
fi

go run ./cmd/ampel verify "${EXAMPLES_PATH}/hello-linux-amd64" \
    --policy "${EXAMPLES_PATH}/osps.branch.policy.json" \
    --attestation "${EXAMPLES_PATH}/carabiner-demo-repo.branches.intoto.json" \
    --attestation "${EXAMPLES_PATH}/carabiner-demo-repo.slsa.bundle.json"

echo "🔎 Verifying Repositoryh"

go run ./cmd/ampel verify "${EXAMPLES_PATH}/hello-linux-amd64" \
    --policy "${EXAMPLES_PATH}/osps.repo.policy.json" \
    --attestation "${EXAMPLES_PATH}/carabiner-demo-repo.repo.intoto.json" \
    --attestation "${EXAMPLES_PATH}/carabiner-demo-repo.slsa.bundle.json"

echo "🔎 Verifying Organization"

go run ./cmd/ampel/ verify "${EXAMPLES_PATH}/hello-linux-amd64" \
    --policy "${EXAMPLES_PATH}/osps.org.policy.json" \
    --attestation "${EXAMPLES_PATH}/carabiner.mfa.intoto.json"

echo "🔎 Verifying Commit"

go run ./cmd/ampel/ verify "${EXAMPLES_PATH}/hello-linux-amd64" \
    --policy "${EXAMPLES_PATH}/osps.sbom.policy.json" \
    --attestation "${EXAMPLES_PATH}/carabiner-demo-repo.slsa.bundle.json" \
    --attestation "${EXAMPLES_PATH}/carabiner-demo-repo.si.bundle.json" \
    --attestation "${EXAMPLES_PATH}/carabiner-demo-repo.spdx.intoto.json"
