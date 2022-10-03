#!/bin/bash

msg=$1
if [[ $msg == "" ]]; then
    msg="update"
fi

git add .
git commit -m $msg
git push origin `git branch | grep '*' | awk '{print $2}'`