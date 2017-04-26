#!/bin/bash
# See https://medium.com/@nthgergo/publishing-gh-pages-with-travis-ci-53a8270e87db
set -o errexit

rm -rf out
mkdir out

# config
git config --global user.email "TheBrokenRail"
git config --global user.name "Travis CI"

# build (CHANGE THIS)
mkdir editor
cd editor
mkdir scratch-gui
git clone https://github.com/LLK/scratch-gui.git scratch-gui-source
cd scratch-gui-source
npm install > /dev/null 2>&1
npm run build > /dev/null 2>&1
cp -r ./build/* ../
cd ../

cd ../
./node_modules/.bin/electron-packager . "Scratch 3.0" --platform win32 --arch x64 --out out --icon icon.ico --asar true
./node_modules/.bin/electron-packager . "Scratch 3.0" --platform win32 --arch ia32 --out out --icon icon.ico --asar true
./node_modules/.bin/electron-packager . "Scratch 3.0" --platform linux --arch x64 --out out --icon icon.png --asar true
./node_modules/.bin/electron-packager . "Scratch 3.0" --platform linux --arch ia32 --out out --icon icon.png --asar true
# ./node_modules/.bin/electron-packager . "Scratch 3.0" --platform linux --arch armv7l --out out --icon icon.png --asar true
./node_modules/.bin/electron-packager . "Scratch 3.0" --platform darwin --arch x64 --out out --icon icon.icns --asar true

# deploy
cd out
zip -r -q -9 Vertical-Win32-x64.zip "Scratch 3.0-win32-x64"
rm -r "Scratch 3.0-win32-x64"
zip -r -q -9 Vertical-Win32-ia32.zip "Scratch 3.0-win32-ia32"
rm -r "Scratch 3.0-win32-ia32"
tar -cvzf Vertical-Linux-x64.tar.gz "Scratch 3.0-linux-x64" > /dev/null 2>&1
rm -r "Scratch 3.0-linux-x64"
tar -cvzf Vertical-Linux-ia32.tar.gz "Scratch 3.0-linux-ia32" > /dev/null 2>&1
rm -r "Scratch 3.0-linux-ia32"
# tar -cvzf Vertical-Linux-armv7l.tar.gz "Scratch 3.0-linux-armv7l" > /dev/null 2>&1
# rm -r "Scratch 3.0-linux-armv7l"
tar -cvzf Vertical-Mac-x64.tar.gz "Scratch 3.0-darwin-x64" > /dev/null 2>&1
rm -r "Scratch 3.0-darwin-x64"
cd ../

rm -r -f "editor"
mkdir editor
cd editor
mkdir scratch-gui
git clone https://github.com/LLK/scratch-gui.git scratch-gui-source
cd scratch-gui-source
echo Install
npm install > /dev/null 2>&1
rm -f "./node_modules/scratch-blocks/dist/vertical.js"
echo Rename
rename ./node_modules/scratch-blocks/dist/horizontal.js ./node_modules/scratch-blocks/dist/vertical.js
echo Build
npm run build > /dev/null 2>&1
cp -r ./build/* ../
cd ../

cd ../
echo Native
./node_modules/.bin/electron-packager . "Scratch 3.0" --platform win32 --arch x64 --out out --icon icon.ico --asar true
./node_modules/.bin/electron-packager . "Scratch 3.0" --platform win32 --arch ia32 --out out --icon icon.ico --asar true
./node_modules/.bin/electron-packager . "Scratch 3.0" --platform linux --arch x64 --out out --icon icon.png --asar true
./node_modules/.bin/electron-packager . "Scratch 3.0" --platform linux --arch ia32 --out out --icon icon.png --asar true
# ./node_modules/.bin/electron-packager . "Scratch 3.0" --platform linux --arch armv7l --out out --icon icon.png --asar true
./node_modules/.bin/electron-packager . "Scratch 3.0" --platform darwin --arch x64 --out out --icon icon.icns --asar true

# deploy
echo Remove
cd out
zip -r -q -9 Horizontal-Win32-x64.zip "Scratch 3.0-win32-x64"
rm -r "Scratch 3.0-win32-x64"
zip -r -q -9 Horizontal-Win32-ia32.zip "Scratch 3.0-win32-ia32"
rm -r "Scratch 3.0-win32-ia32"
tar -cvzf Horizontal-Linux-x64.tar.gz "Scratch 3.0-linux-x64" > /dev/null 2>&1
rm -r "Scratch 3.0-linux-x64"
tar -cvzf Horizontal-Linux-ia32.tar.gz "Scratch 3.0-linux-ia32" > /dev/null 2>&1
rm -r "Scratch 3.0-linux-ia32"
# tar -cvzf Horizontal-Linux-armv7l.tar.gz "Scratch 3.0-linux-armv7l" > /dev/null 2>&1
# rm -r "Scratch 3.0-linux-armv7l"
tar -cvzf Horizontal-Mac-x64.tar.gz "Scratch 3.0-darwin-x64" > /dev/null 2>&1
rm -r "Scratch 3.0-darwin-x64"

rm -r -f "scratch-gui-source"

echo Final
cp ../index.md ./
cp ../_config.yml ./
git init
git add .
git commit -m "Deploy to Github Pages"
git push --force "https://${GITHUB_TOKEN}@github.com/${GITHUB_REPO}.git" master:gh-pages
exit 0
