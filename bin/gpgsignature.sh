#!/bin/bash
# https://www.gnupg.org/gph/en/manual.html
filename=$1
# echo $filename
defaultkey=""
gpg --detach-sign -o $filename.gpg --armor $filename
# to sign with a specific key
# gpg --default-key $defaultkey --detach-sign -o $filename.gpg --armor $filename

