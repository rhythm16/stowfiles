#! /bin/env bash

echo "Enter Email:"
read email
ssh-keygen -t ed25519 -C "${email}"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
