#!/bin/bash

if [[ -d .git ]] ; then rm -rf .git ; fi
    
git init ; git checkout -B main
    
git remote add origin git@github.com:AmalLight/"${PWD##*/}".git
    
git add . ; git commit -m "init main"

git push -f origin HEAD:main
