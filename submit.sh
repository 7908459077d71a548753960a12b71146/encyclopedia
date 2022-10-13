#!/bin/bash

msg=$@
if [[ $msg == "" ]]; then
    msg="update"
fi

git add .
git commit -m "$msg"
git push origin `git branch | grep '*' | awk '{print $2}'`