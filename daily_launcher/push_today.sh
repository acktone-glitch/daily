#!/bin/bash

today=$(date +%Y-%m-%d)

cd ~/coding_routine

git add .
git commit -m "Daily coding — $today"
git push origin master
