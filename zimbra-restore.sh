#!/bin/bash
# The script should be run as the zimbra user
# save the file as zimbra_restore.sh in the folder containing the backup files
# Run on folder with backup files as: ls *.tgz | xargs -P 4 -n 1 /path/to/zimbra_restore.sh
# The file expects backup files to be in the format: username.EXT
# Change the number after -P to control the number of processes. Try and match this up with the number of CPU cores
# Change the value of EXT to .zip if restoring .zip files
# Change the value of domain to the domain you are restoring the accounts to
# Note that the accounts must already exist on the server
EXT=.tgz
DOMAIN=example.com

for f in "$1"
do
  echo "Processing $f ..."
  zmmailbox -z -m ${f%$EXT}@DOMAIN postRestURL '//?fmt='$EXT'&resolve=reset' $f &
done

