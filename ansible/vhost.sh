#!/bin/bash
if [ "$1" = "" ]
then
  echo "Usage: $0 <site_name> <public folder: default 'web'>"
  exit
fi
ansible-playbook -i hosts vhost.yml --extra-vars "site_name=$1" -K
