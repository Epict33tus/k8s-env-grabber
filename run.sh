#!/bin/zsh

# TODO - review scrape to check all containers - a lot of work. Needs another JS pipe for string parse.
./scrape.sh | node parse 
# TODO - review pipe to remove errors

