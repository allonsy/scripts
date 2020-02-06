#!/bin/bash
# locks down a git repository to only accept signed commits

set -e
IFS=$'\n' GPG_OUTPUT=$(gpg -K)
declare -a GPG_LINES
for GPG_LINE in ${GPG_OUTPUT[@]}; do
    GPG_LINES+=("$GPG_LINE")
done

declare -a CHOICES
for GPG_LINE_INDEX in "${!GPG_LINES[@]}"; do
    GPG_LINE="${GPG_LINES[$GPG_LINE_INDEX]}"
    if [[ "$GPG_LINE" == sec* ]]; then
        GPG_KEY_ID=$(sed 's/ //g' <<< "${GPG_LINES[$((GPG_LINE_INDEX+1))]}")
        IFS=" " read -a UID_VALS <<< "${GPG_LINES[$((GPG_LINE_INDEX+2))]}"
        for UID_VAL in "${UID_VALS[@]}"; do
            if [[ $UID_VAL == "<"* ]]; then
                CHOICES+=("$UID_VAL: $GPG_KEY_ID")
                break
            fi
        done
    fi
done

echo "Please choose a private key to use for signing: "
for CHOICE_INDEX in "${!CHOICES[@]}"; do
    CHOICE="${CHOICES[$CHOICE_INDEX]}"
    echo "$CHOICE_INDEX) $CHOICE"
done

echo -n "Your Selection: "
read USER_CHOICE

LINE_CHOICE="${CHOICES[$USER_CHOICE]}"
if [ -z $LINE_CHOICE ]; then
    echo "Unknown choice: $USER_CHOICE"
    exit 1
fi

IFS=" " read -a CHOSEN_SPLIT <<< "${LINE_CHOICE}"
KEYUID="${CHOSEN_SPLIT[1]}"
echo "CHOSEN KEY ID: $KEYUID"

set +e
set -x

git config user.signingkey $KEYUID
git config commit.gpgSign true
git config merge.verifySignatures true
git config receive.fsckObjects true
