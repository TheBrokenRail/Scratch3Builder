#!/bin/bash
# See https://medium.com/@nthgergo/publishing-gh-pages-with-travis-ci-53a8270e87db
set -o errexit

rm -rf out
mkdir out

# config
git config --global user.email "TheBrokenRail"
git config --global user.name "Travis CI"

# build (CHANGE THIS)
node index.js

# deploy
cd out
git init
git add .
git commit -m "Deploy to Github Pages"
git push --force "https://${GITHUB_TOKEN}@$github.com/${GITHUB_REPO}.git" master:gh-pages
