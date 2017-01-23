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
zip -r -q -9 Win32-x64.zip "Scratch 3.0-win32-x64"
rm -r "Scratch 3.0-win32-x64"
zip -r -q -9 Win32-ia32.zip "Scratch 3.0-win32-ia32"
rm -r "Scratch 3.0-win32-ia32"
zip -r -q -9 Linux-x64.zip "Scratch 3.0-linux-x64"
rm -r "Scratch 3.0-linux-x64"
zip -r -q -9 Linux-ia32.zip "Scratch 3.0-linux-ia32"
rm -r "Scratch 3.0-linux-ia32"
tar -cvzf Mac-x64.tar.gz "Scratch 3.0-darwin-x64"
rm -r "Scratch 3.0-darwin-x64"
cp ../index.md ./
cp ../_config.yml ./
dir
git init
git add .
git commit -m "Deploy to Github Pages"
git push --force "https://${GITHUB_TOKEN}@github.com/${GITHUB_REPO}.git" master:gh-pages
exit 0
