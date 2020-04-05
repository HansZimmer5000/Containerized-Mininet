#!/bin/sh

git checkout v2.2
git merge master
git push

git checkout v2.3
git merge master
git push

git checkout master