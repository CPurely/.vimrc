#!/bin/sh

echo "\033[0;32mDeploying updates to GitHub...\033[0m"

cd ~/.vim
git add -A

# Commit changes.
msg="update dotfile `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
