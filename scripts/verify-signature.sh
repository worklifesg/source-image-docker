#!/bin/bash
# Usage: ./verify-signature.sh <image-uri> <kms-key-arn> <signature-repo>

IMAGE=$1
KEY_ARN=$2
SIG_REPO=$3

echo "Verifying $IMAGE using key $KEY_ARN..."

# Set COSIGN_REPOSITORY to tell cosign where to look for signatures
export COSIGN_REPOSITORY=$SIG_REPO

cosign verify \
  --key "awskms:///${KEY_ARN}" \
  "$IMAGE"
