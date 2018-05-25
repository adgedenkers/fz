#!/bin/bash
# -----------------------------------------------------
# Adge Denkers
# adge.denkers@gmail.com
# file name: example_loop_through_subdirectories.sh
# date: 2017-10-19
# -----------------------------------------------------

for d in /Users/adge/dev/*; do
  if [ -d "$d" ]; then
    # echo "$d"/.git/config

    # Open the file $d

    # Edit the file, and replace the URL with the URL for our GitHub Repo
    #${d/denkers/denkers:Sh4pley607*S3h74t26}
  fi
done