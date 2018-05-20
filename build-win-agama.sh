#!/bin/bash


yes | cp -rf /src/{komodod.exe,komodo-cli.exe,komodo-tx.exe} agama/assets/bin/win64
cd agama
npm install
electron-packager . --platform=win32 --arch=x64 --icon=assets/icons/agama_icons/agama_app_icon.ico --out=build/ --buildVersion=0.3 --ignore=assets/bin/osx --ignore=assets/bin/linux64 --overwrite
cd build
zip -r Agama-Win.zip Agama-win32-x64/


