#!/bin/bash
# locks down a git repository to only accept signed commits

KEYUID="72FC4E7F29E6D8491228DA55E6EAD3EBE3CC6E71"

git config user.signingkey $KEYUID
git config commit.gpgSign true
git config merge.verifySignatures true
