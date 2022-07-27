#!/bin/zsh

cat .env | sort -k 2 > "${1}.env"
