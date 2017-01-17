#!/bin/bash

#
# init git project
# author @liujiaming
# date   @20170117
# github @https://github.com/ljmdbc7a/shell-scripts
#

echo -e ".idea\n*.iml\n*.bak\ntarget/\n" >> .gitignore
git init
git remote add origin https://host/$name.git
git add .
git commit -m "initial commit"
git push --set-upstream origin master

