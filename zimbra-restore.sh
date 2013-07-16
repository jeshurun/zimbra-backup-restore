#!/bin/bash
# The script should be run as the zimbra user
# Run on folder with backup files as: ls *.tgz | xargs -P 4 -n 1 /path/to/zimbra_restore.sh
# The file expects backup files to be in the format: username.EXT
# Change the number after -P to control the number of processes
# Change the value of EXT to .zip if restoring .zip files
# Change the value of domain to the domain you are restoring the accounts to
EXT=.tgz
DOMAIN=example.com

for f in "$1"
do
  echo "Processing $f ..."
  zmmailbox -z -m ${f%$EXT}@DOMAIN postRestURL '//?fmt='$EXT'&resolve=reset' $f &
done

