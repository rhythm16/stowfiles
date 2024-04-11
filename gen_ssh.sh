#! /bin/env bash

echo "Enter Email:"
read email
echo "Key name:"
read key_name
ssh-keygen -t ed25519 -C "${email}" -f ~/.ssh/${key_name}
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/${key_name}
cat ~/.ssh/${key_name}.pub
