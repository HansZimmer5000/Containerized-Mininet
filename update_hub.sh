#!/bin/sh

# This will trigger a build for a ":v2.2-latest" image build
git checkout v2.2
git merge master
git push

# This will trigger a build for a ":v2.3-latest" and ":latest" image build
git checkout v2.3
git merge master
git push

# This will trigger a build for a ":buster-v2.3-latest" image build
git checkout buster-v2.2
git merge master
git push

git checkout master