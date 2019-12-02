#!/bin/bash
# locks down a git repository to only accept signed commits
set -x

KEYUID="1D709E45FA9739EB9EC620240CA1D8E66C99F04F"

git config user.signingkey $KEYUID
git config commit.gpgSign true
git config merge.verifySignatures true
git config receive.fsckObjects true
